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
          Image(uiImage: #imageLiteral(resourceName: "onboard"))
          Spacer()
          PrimaryButton(title: "Welcome To TweetSense", action: {})
          navigationSignInView
          navigationRegisterView
          bottomView
        }
      }
      .padding()
    }
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
