//
//  SignInScreenView.swift
//  TweetSense
//
//  Created by Navin Kumar R on 12/03/24.
//

import SwiftUI
import SimpleToast

struct SignInScreenView: View {
  
  @StateObject var viewModel: SignInScreenVM
  
  private let toastOptions = SimpleToastOptions(hideAfter: 3, modifierType: .scale)
  
  init() {
    _viewModel = .init(wrappedValue: .init())
  }
  
  var body: some View {
    mainView
      .simpleToast(isPresented: $viewModel.showToast, options: toastOptions) {
        ToastView(toastMessage: viewModel.toastMessage)
      }
    NavigationLink("", destination: HomeView(), isActive: $viewModel.isSignIn)
      .hidden()
      .foregroundColor(Color("PrimaryColor"))
  }
  
  private var mainView: some View {
    ZStack {
      Color("BgColor").edgesIgnoringSafeArea(.all)
      VStack {
        Spacer()
        signInView
        Spacer()
        Divider()
        Spacer()
        bottomView
        Spacer()
        
      }
      .padding()
    }
  }
  
  private var signInView: some View {
    VStack {
      Text("Sign In")
        .font(.largeTitle)
        .fontWeight(.bold)
        .padding(.bottom, 30)
      
      CommonTextfield(text: $viewModel.email, title: "Email")
      SecureTextfield(text: $viewModel.password, title: "Password")
      PrimaryButton(title: "SignIn") {
        viewModel.signInUserAndSetToastMessage(email: viewModel.email, password: viewModel.password)
      }
      .padding(.top, 40)
    }
  }
  
  private var bottomView: some View {
    VStack {
      Text("You are completely safe.")
      Text("Read our Terms & Conditions.")
        .foregroundColor(Color("PrimaryColor"))
    }
  }
}

struct SignInScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreenView()
    }
}
