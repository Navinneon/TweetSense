//
//  TextSentinmentView.swift
//  TweetSense
//
//  Created by Navin Kumar R on 05/04/24.
//

import SwiftUI

struct TextSentinmentView: View {
  
  @StateObject var viewModel: TextSentimentViewModel
  
  init() {
    _viewModel = .init(wrappedValue: .init())
  }
  
  var body: some View {
    mainView
      .sheet(isPresented: $viewModel.isSearchButtonClicked, content: {
        Animate_OverlayView(
          lottieAnimateName: viewModel.lottieAnimateName,
          sentiment: viewModel.sentiment
        )
      })
  }
  
  private var mainView: some View {
    VStack(alignment: .center, spacing: 20) {
      textField
        .frame(height: 40)
        .padding(20)
      Spacer()
      lottiAnimateView
      Spacer()
      Text("Search")
        .font(.title3)
        .fontWeight(.semibold)
        .foregroundStyle(.gray)
    }
    .frame(maxWidth: .infinity)
  }
  
  private var textField: some View {
    HStack {
      TextField("Search", text: $viewModel.search)
        .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 0))
        .background(Color.white)
        .foregroundColor(.black)
        .cornerRadius(20)
        .overlay(
          RoundedRectangle(cornerRadius: 20)
            .stroke(Color.blue, lineWidth: 1)
        )
        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 0))
      
      Button(action: {
        viewModel.classifyText()
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
  
  private var lottiAnimateView: some View {
    LottieView(name: "Search", loopMode: .loop)
      .scaledToFit()
      .frame(maxWidth: 200, maxHeight: 200)
      .background(Color.white)
  }
}

struct SearchButtonView_Previews: PreviewProvider {
  static var previews: some View {
    TextSentinmentView()
  }
}
