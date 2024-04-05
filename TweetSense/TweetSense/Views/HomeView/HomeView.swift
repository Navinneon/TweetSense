//
//  HomeView.swift
//  TweetSense
//
//  Created by Navin Kumar R on 04/04/24.
//

import SwiftUI

struct HomeView: View {
  
  @StateObject var viewModel: HomeViewModel
  
  init() {
    _viewModel = .init(wrappedValue: .init())
  }
  
  var body: some View {
    NavigationView {
      ScrollView {
        mainView
          .padding()
      }
    }
    .navigationBarHidden(true)
    .alert(isPresented: $viewModel.showAlert) {
      Alert(title: Text("Logout"), message: Text("Do you want to Logout"), primaryButton: .default(Text("Confirm"), action: {
        viewModel.logout()
      }), secondaryButton: .cancel())
    }
  }

  private var mainView: some View {
    VStack(spacing: 40) {
      homeBar
        .padding(.horizontal)
      
      NavigationLink(destination: TweetClassifierView()) {
        CardView(color: .teal, imageName: "TweetClassifier", title: "Tweet Classifier")
      }
      
      NavigationLink(destination: TextSentinmentView()) {
        CardView(color: .pink.opacity(0.5), imageName: "Text Analysis", title: "Text Sentiment Analysis")
      }
      
      NavigationLink(
        destination: WelcomeScreenView(),
        isActive: $viewModel.isLoggedOut,
        label: {
          EmptyView()
        })
      .hidden()
    }
  }

  
  private var homeBar: some View {
    HStack {
      Text("Home")
        .font(.title)
        .fontWeight(.bold)
      
      Spacer()
      
      Button(action: {
        viewModel.showAlert = true
      }) {
        Text("Logout")
          .foregroundColor(.blue)
      }
    }
  }
}

struct CardView: View {
  var color: Color
  var imageName: String
  var title: String
  
  var body: some View {
    RoundedRectangle(cornerRadius: 20)
      .fill(color)
      .opacity(0.3)
      .shadow(color: .gray, radius: 0.1)
      .frame(height: 400)
      .overlay(
        VStack {
          Text(title)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.black)
            .padding(.top, 20)
                    
          Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            
        }
          .padding()
      )
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
