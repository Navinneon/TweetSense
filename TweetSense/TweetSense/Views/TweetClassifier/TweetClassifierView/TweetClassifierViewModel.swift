//
//  HomeViewModel.swift
//  TweetSense
//
//  Created by Navin Kumar R on 31/03/24.
//

import SwiftUI
import CoreML

class TweetClassifierViewModel: ObservableObject {
  
  var tweets: [Tweet] = []
  @Published var searchText = ""
  @Published var isSearchButtonClicked = false
  let sentimentClassifier = TweetSentimentClassifier()
  var classifiedTweets = [TweetSentimentClassifierInput]()
  
  @Published var barChartData: [BarChartViewData] = []
  @Published var pieChartData: [PieChartData] = []

  var filteredTweets: [Tweet] {
    if searchText.isEmpty {
      return []
    } else {
      return tweets.filter { $0.text.localizedCaseInsensitiveContains(searchText) }
    }
  }
  
  func loadTweetsFromCSV() {
    if let csvPath = Bundle.main.path(forResource: "apple", ofType: "csv") {
      do {
        let csvData = try String(contentsOfFile: csvPath, encoding: .utf8)
        let rows = csvData.components(separatedBy: .newlines)
        
        for row in rows {
          let columns = row.components(separatedBy: ",")
          if columns.count >= 2 {
            let tweet = Tweet(text: columns[1])
            tweets.append(tweet)
          }
        }
      } catch {
        print("Error reading CSV file:", error.localizedDescription)
      }
    } else {
      print("CSV file not found.")
    }
  }
  
   func classifyTweets() {
    filteredTweets.forEach { tweet in
      let eachTweet = tweet.text
      let tweetForClassification = TweetSentimentClassifierInput(text: eachTweet)
      classifiedTweets.append(tweetForClassification)
    }
    predictingSentiment()
  }
  
  func predictingSentiment() {
    do {
      let predictions = try self.sentimentClassifier.predictions(inputs: classifiedTweets)
      
      var counts: [String: Int] = ["positive": 0, "negative": 0, "neutral": 0]
      
      for pred in predictions {
        let sentiment = pred.label
        counts[sentiment, default: 0] += 1
      }

      barChartData = [
        BarChartViewData(sentiment: "Positive", count: counts["positive"] ?? 0, color: .red),
        BarChartViewData(sentiment: "Negative", count: counts["negative"] ?? 0, color: .blue),
        BarChartViewData(sentiment: "Neutral", count: counts["neutral"] ?? 0, color: .green)
      ]
      
      pieChartData = [
        PieChartData(sentiment: "Positive", count: counts["positive"] ?? 0),
        PieChartData(sentiment: "Negative", count: counts["negative"] ?? 0),
        PieChartData(sentiment: "Neutral", count: counts["neutral"] ?? 0)
      ]
      
    } catch {
      print("There was an error with making a prediction, \(error)")
    }
  }


  
  
}

