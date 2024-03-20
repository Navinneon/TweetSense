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
  
  private let toastOptions = SimpleToastOptions(hideAfter: 3, modifierType: .scale)
  
  init() {
    _viewModel = .init(wrappedValue: .init())
  }
  
  var body: some View {
    ZStack {
      Color("BgColor").edgesIgnoringSafeArea(.all)
      VStack {
        Spacer()
        VStack {
          Text("Register")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.bottom, 30)
          
          CommonTextfield(text: $viewModel.email, title: "Email")
          CommonTextfield(text: $viewModel.password, title: "Password")
          CommonTextfield(text: $viewModel.confirmPassword, title: "Confirm Password")
          PrimaryButton(title: "Register") {
            viewModel.createUserAndSetToastMessage(email: viewModel.email, password: viewModel.password)
          }
          .padding(.top, 40)
        }
        Spacer()
        Divider()
        Spacer()
        Text("You are completely safe.")
        Text("Read our Terms & Conditions.")
          .foregroundColor(Color("PrimaryColor"))
        Spacer()
      }
      .padding()
    }
    .simpleToast(isPresented: $viewModel.showToast, options: toastOptions) {
      Label(viewModel.toastMessage, systemImage: "exclamationmark.triangle")
      .padding()
      .background(Color("PrimaryColor").opacity(0.8))
      .foregroundColor(Color.white)
      .cornerRadius(10)
      .padding(.top)
  }
  }
}

struct RegisterScreenView_Previews: PreviewProvider {
  static var previews: some View {
    RegisterScreenView()
  }
}
