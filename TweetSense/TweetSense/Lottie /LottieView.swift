//
//  LottieView.swift
//  TweetSense
//
//  Created by Navin Kumar R on 04/04/24.
//

import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable {
  
  var name = "Welcome"
  var loopMode: LottieLoopMode = .loop
  
  func makeUIView(context: Context) -> LottieAnimationView {
    let view = LottieAnimationView(name: name, bundle: Bundle.main)
    view.loopMode = loopMode
    view.play()
    
    return view
  }
  
  func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct LottieView_Previews: PreviewProvider {
  static var previews: some View {
    LottieView()
      .scaledToFit()
      .frame(maxWidth: 50, maxHeight: 50) //
      .background(Color.white)
  }
}
