//
//  BarChartView.swift
//  TweetSense
//
//  Created by Navin Kumar R on 31/03/24.
//

import SwiftUI
import Charts

struct BarChartView: View {
  let data: [BarChartViewData]
  
  var body: some View {
    Chart {
      ForEach(data, id: \.sentiment) { point in
        BarMark(x: .value("Sentiment", point.sentiment),
                y: .value("Count", point.count))
        .foregroundStyle(point.color)
      }
    }
    .aspectRatio(1, contentMode: .fit)
    .padding()
  }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        let data: [BarChartViewData] = [
          BarChartViewData(sentiment: "Positive", count: 10, color: .red),
          BarChartViewData(sentiment: "Negative", count: 5, color: .blue),
          BarChartViewData(sentiment: "Neutral", count: 8, color: .green)
        ]
        return BarChartView(data: data)
    }
}
