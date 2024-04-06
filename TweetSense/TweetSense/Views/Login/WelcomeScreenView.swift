//
//  WelcomeScreenView.swift
//  TweetSense
//
//  Created by Navin Kumar R on 12/03/24.
//

import SwiftUI

struct WelcomeScreenView: View {
  
  var body: some View {
    mainView
      .navigationBarHidden(true)
  }
  
  private var mainView: some View {
    NavigationView {
      ZStack {
        Color("BgColor").edgesIgnoringSafeArea(.all)
        VStack {
          Spacer()
          lottiAnimateView
          Spacer()
          PrimaryButton(title: "Welcome To TweetSense", action: {})
            .padding(.top, 20)
          navigationSignInView
          navigationRegisterView
          bottomView
        }
      }
      .padding()
    }
  }
  
  private var lottiAnimateView: some View {
    LottieView(name: "Welcome", loopMode: .loop)
      .scaledToFit()
      .frame(maxWidth: 200, maxHeight: 200)
      .background(Color.white)
  }
  
  private var navigationSignInView: some View {
    NavigationLink(
      destination: SignInScreenView(),
      label: {
        SecondaryButton(title: "SignIn")
      })
  }
  
  private var navigationRegisterView: some View {
    NavigationLink(
      destination: RegisterScreenView(),
      label: {
        SecondaryButton(title: "Register")
      })
  }
  
  private var bottomView: some View {
    HStack {
      Text("New around here? ")
      NavigationLink(destination: RegisterScreenView()) {
        Text("Register")
      }
      .foregroundColor(Color("PrimaryColor"))
    }
    .padding()
  }
}

struct WelcomeScreenView_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeScreenView()
  }
}
