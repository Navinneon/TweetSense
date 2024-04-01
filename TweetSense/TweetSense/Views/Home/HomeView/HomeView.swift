//
//  HomeView.swift
//  TweetSense
//
//  Created by Navin Kumar R on 28/03/24.
//

import SwiftUI

struct Tweet: Identifiable {
    let id = UUID()
    let text: String
}

struct HomeView: View {

  @State private var tweets: [Tweet] = []
  @State private var searchText = ""
  @State private var isSearchButtonClicked = false
  let barChartData: [BarChartViewData] = [
    BarChartViewData(sentiment: "Positive", count: 10, color: .red),
    BarChartViewData(sentiment: "Negative", count: 5, color: .blue),
    BarChartViewData(sentiment: "Neutral", count: 8, color: .green)
 ]
  
  var filteredTweets: [Tweet] {
    if searchText.isEmpty {
      return []
    } else {
      return tweets.filter { $0.text.localizedCaseInsensitiveContains(searchText) }
    }
  }
  
  var body: some View {
    VStack {
      // Search bar
      HStack {
        TextField("Search", text: $searchText)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .onChange(of: searchText) { newValue in
            isSearchButtonClicked = false
          }
        Button(action: {
          isSearchButtonClicked = true
        }) {
          Text("Search")
        }
      }
      .padding()
      
      if isSearchButtonClicked {
        mainView()
      } else {
        EmptyView()
      }
      
      Spacer()
    }
    .onAppear {
      loadTweetsFromCSV()
    }
    .background(Color("BgColor"))
  }
  
  func mainView() -> some View {
    VStack(spacing: 20) {
      List(filteredTweets) { tweet in
        Text(tweet.text)
      }
      HStack(spacing: 20) {
        BarChartView(data: barChartData)
      }
    }
  }
  
  func loadTweetsFromCSV() {
    if let csvPath = Bundle.main.path(forResource: "apple", ofType: "csv") {
      do {
        let csvData = try String(contentsOfFile: csvPath, encoding: .utf8)
        let rows = csvData.components(separatedBy: .newlines)
        
        // Parse each row and extract tweet text
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
