//
//  HomeModel.swift
//  TweetSense
//
//  Created by Navin Kumar R on 01/04/24.
//

import SwiftUI

struct Tweet: Identifiable {
    let id = UUID()
    let text: String
}

struct BarChartViewData {
    let sentiment: String
    let count: Int
    let color: Color
}

struct PieChartData {
    let sentiment: String
    let count: Int
}
