//
//  Animate OverlayView.swift
//  TweetSense
//
//  Created by Navin Kumar R on 05/04/24.
//

import SwiftUI

struct Animate_OverlayView: View {
  
  @State var lottieAnimateName: String = ""
  @State var sentiment: String = ""
  
    var body: some View {
        mainView
    }
  
  private var mainView: some View {
    VStack(alignment: .center, spacing: 20) {
      Spacer()
      lottiAnimateView
      Spacer()
      Text(sentiment.localizedCapitalized)
        .font(.title3)
        .fontWeight(.semibold)
        .foregroundStyle(.gray)
    }
    .frame(maxWidth: .infinity)
  }
  
  private var lottiAnimateView: some View {
    LottieView(name: lottieAnimateName, loopMode: .loop)
      .scaledToFit()
      .frame(maxWidth: 200, maxHeight: 200)
      .background(Color.white)
  }
  
}

#Preview {
    Animate_OverlayView()
}
