//
//  SectorMarkView.swift
//  TweetSense
//
//  Created by Navin Kumar R on 31/03/24.
//

import SwiftUI
import Charts

struct PieChartData {
    let sentiment: String
    let count: Int
}

struct PieChartView: View {
  let data: [PieChartData]
   
    var body: some View {
        Chart(data, id: \.sentiment) { data in
            SectorMark(
                angle: .value("Value", Double(data.count)),
                innerRadius: .ratio(0.618),
                outerRadius: .inset(10),
                angularInset: 1
            )
            .cornerRadius(4)
            .foregroundStyle(by: .value("Product category", data.sentiment))
        }
    }
}


struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        let data: [PieChartData] = [
          PieChartData(sentiment: "Positive", count: 10),
          PieChartData(sentiment: "Negative", count: 5),
          PieChartData(sentiment: "Neutral", count: 8)
        ]
        return PieChartView(data: data)
    }
}

