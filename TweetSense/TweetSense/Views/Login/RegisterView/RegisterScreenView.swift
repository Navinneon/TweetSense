//
//  RegisterScreenView.swift
//  TweetSense
//
//  Created by Navin Kumar R on 12/03/24.
//

import SwiftUI
import SimpleToast

struct RegisterScreenView: View {
  
  @StateObject var viewModel: RegisterScreenVM
  private let toastOptions = SimpleToastOptions(hideAfter: 3, modifierType: .fade)
  
  init() {
    _viewModel = .init(wrappedValue: .init())
  }
  
  var body: some View {
    mainView
    .simpleToast(isPresented: $viewModel.showToast, options: toastOptions) {
      ToastView(toastMessage: viewModel.toastMessage)
    }
    NavigationLink("", destination: HomeView(), isActive: $viewModel.isRegistered)
      .hidden()
      .foregroundColor(Color("PrimaryColor"))
  }
  
  private var mainView: some View {
    ZStack {
      Color("BgColor").edgesIgnoringSafeArea(.all)
      VStack {
        Spacer()
        registerView
        Spacer()
        Divider()
        Spacer()
        bottomView
        Spacer()
      }
      .padding()
    }
  }
  
  private var registerView: some View {
    VStack {
      Text("Register")
        .font(.largeTitle)
        .fontWeight(.bold)
        .padding(.bottom, 30)
      
      CommonTextfield(text: $viewModel.email, title: "Email")
      SecureTextfield(text: $viewModel.password, title: "Password")
      SecureTextfield(text: $viewModel.confirmPassword, title: "Confirm Password")
      
      PrimaryButton(title: "Register") {
        viewModel.createUserAndSetToastMessage(email: viewModel.email, password: viewModel.password)
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

struct RegisterScreenView_Previews: PreviewProvider {
  static var previews: some View {
    RegisterScreenView()
  }
}
