//
//  HomeView.swift
//  TweetSense
//
//  Created by Navin Kumar R on 28/03/24.
//

import SwiftUI

struct TweetClassifierView: View {
  
  @StateObject var viewModel: TweetClassifierViewModel
  
  init() {
    _viewModel = .init(wrappedValue: .init())
  }
  
  var body: some View {
    mainView
      .background(Color("BgColor"))
      .onAppear {
        viewModel.loadTweetsFromCSV()
      }
  }
  
  private var mainView: some View {
    VStack {
      textField
        .frame(height: 40)
        .padding(20)
      searchBtnClicked
        .frame(maxHeight: .infinity)
      Spacer()
    }
  }
  
  private var textField: some View {
    HStack {
      TextField("Search", text: $viewModel.searchText)
        .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 0))
        .background(Color.white)
        .foregroundColor(.black)
        .cornerRadius(20)
        .overlay(
          RoundedRectangle(cornerRadius: 20)
            .stroke(Color.blue, lineWidth: 1)
        )
//        .onChange(of: viewModel.searchText) { newValue in
//          viewModel.isSearchButtonClicked = false
//        }
        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 0))
      
      Button(action: {
//        viewModel.isSearchButtonClicked = true
        if !viewModel.searchText.isEmpty
            && !viewModel.filteredTweets.isEmpty{
          viewModel.classifyTweets()
        }
      }) {
        Text("Search")
          .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
          .background(Color.white)
          .foregroundColor(.blue)
          .cornerRadius(20)
          .overlay(
            RoundedRectangle(cornerRadius: 20)
              .stroke(Color.blue, lineWidth: 1)
          )
          .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 10))
      }
    }
  }
  
  private var searchBtnClicked: some View {
    if !viewModel.searchText.isEmpty
        && !viewModel.filteredTweets.isEmpty {
      AnyView(listView)
    } else {
      AnyView(lottiAnimateView)
    }
  }
  
  private var listView: some View {
    VStack(spacing: 10) {
      List(viewModel.filteredTweets) { tweet in
        Text(tweet.text)
      }
      
      ScrollView(.horizontal) {
        HStack(alignment: .center, spacing: 10) {
          GeometryReader { geometry in
            BarChartView(data: viewModel.barChartData)
              .frame(width: UIScreen.main.bounds.width)
          }
          .frame(width: UIScreen.main.bounds.width)
           
          Divider()
          
          GeometryReader { geometry in
            PieChartView(data: viewModel.pieChartData)
              .frame(width: UIScreen.main.bounds.width)
          }
          .frame(width: UIScreen.main.bounds.width)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
      }
    }
  }

  
  private var lottiAnimateView: some View {
    LottieView(name: "Search", loopMode: .loop)
      .scaledToFit()
      .frame(maxWidth: 200, maxHeight: 200)
      .background(Color.white)
  }
}

struct TweetClassifierView_Previews: PreviewProvider {
  static var previews: some View {
    TweetClassifierView()
  }
}
