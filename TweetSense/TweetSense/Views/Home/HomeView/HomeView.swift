//
//  HomeView.swift
//  TweetSense
//
//  Created by Navin Kumar R on 28/03/24.
//

import SwiftUI

struct HomeView: View {
  
  @StateObject var viewModel: HomeViewModel
  
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
      searchBar
        .padding()
      searchBtnClicked
      Spacer()
    }
  }
  
  private var searchBar: some View {
    HStack {
      TextField("Search", text: $viewModel.searchText)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .onChange(of: viewModel.searchText) { newValue in
          viewModel.isSearchButtonClicked = false
        }
      Button(action: {
        viewModel.isSearchButtonClicked = true
        if viewModel.isSearchButtonClicked
            && !viewModel.searchText.isEmpty
            && !viewModel.filteredTweets.isEmpty{
          viewModel.classifyTweets()
        }
      }) {
        Text("Sentiment")
          .foregroundStyle(.selection)
      }
    }
  }
  
  private var searchBtnClicked: some View {
    if viewModel.isSearchButtonClicked
        && !viewModel.searchText.isEmpty
        && !viewModel.filteredTweets.isEmpty {
      AnyView(listView)
    } else {
      AnyView(noDataView)
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

  
  private var noDataView: some View {
    VStack(spacing: 20) {
      Spacer()
      Image(uiImage: #imageLiteral(resourceName: "noData"))
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 75, height: 75) // Set a fixed size for the image
      NoDataButton(title: "No Available Data")
      Spacer()
    }
    .padding(20)
    .cornerRadius(10)
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
