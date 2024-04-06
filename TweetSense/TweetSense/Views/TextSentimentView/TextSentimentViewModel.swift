//
//  TextSentimentViewModel.swift
//  TweetSense
//
//  Created by Navin Kumar R on 05/04/24.
//

import Foundation
import CoreML
import Combine

class TextSentimentViewModel: ObservableObject {
  
  @Published var search = ""
  @Published var isSearchButtonClicked = false
  var lottieAnimateName = ""
  var sentiment = ""
  
  let sentimentClassifier = TweetSentimentClassifier()
  
  func classifyText() {
    do {
      let predictions = try self.sentimentClassifier.prediction(text: search)
      sentiment = predictions.label
      
      switch sentiment {
      case "positive":
        lottieAnimateName = "PositiveEmoji"
      case "negative":
        lottieAnimateName = "NegativeEmoji"
      case "neutral":
        lottieAnimateName = "NeutralEmoji"
      default:
        lottieAnimateName = "Search"
      }
      isSearchButtonClicked = true
      
    } catch {
      print("There was an error with making a prediction, \(error)")
    }
  }
}
