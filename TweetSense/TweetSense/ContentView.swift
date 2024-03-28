//
//  ContentView.swift
//  TweetSense
//
//  Created by Navin Kumar R on 12/03/24.
//

import SwiftUI

struct ContentView: View {
  
  var body: some View {
    if let token = DataManager.shared.getToken() {
      HomeView()
    } else {
      WelcomeScreenView()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
