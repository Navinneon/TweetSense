//
//  ComponentViews.swift
//  TweetSense
//
//  Created by Navin Kumar R on 12/03/24.
//

import SwiftUI

struct PrimaryButton: View {
  var title: String
  var action: () -> Void // Closure for the button action
  
  var body: some View {
    Button(action: action) { // Binding the action closure to the button
      Text(title)
        .font(.title3)
        .fontWeight(.bold)
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color("PrimaryColor"))
        .cornerRadius(50)
    }
  }
}

struct SecondaryButton: View {
  var title: String
  var body: some View {
    Text(title)
      .font(.title3)
      .fontWeight(.bold)
      .foregroundColor(Color("PrimaryColor"))
      .padding()
      .frame(maxWidth: .infinity)
      .background(Color.white)
      .cornerRadius(50.0)
      .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
  }
}

struct NoDataButton: View {
  var title: String
  
  var body: some View {
    Text(title)
      .font(.headline)
      .fontWeight(.bold)
      .foregroundColor(.gray)
      .padding()
      .frame(maxWidth: .infinity)
      .cornerRadius(50.0)
      .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
      .background(Color.clear)
      .foregroundStyle(.black)
  }
}


struct CommonTextfield: View {
  @Binding var text: String
  var title: String
  
  var body: some View {
    TextField(title, text: $text)
      .font(.title3)
      .padding()
      .frame(maxWidth: .infinity)
      .background(Color.white)
      .cornerRadius(50.0)
      .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
  }
}

struct SecureTextfield: View {
  @Binding var text: String
  var title: String
  
  var body: some View {
    SecureField(title, text: $text)
      .font(.title3)
      .padding()
      .frame(maxWidth: .infinity)
      .background(Color.white)
      .cornerRadius(50.0)
      .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
  }
}
  
struct ToastView: View {
  var toastMessage: String
  
  var body: some View {
    Label(toastMessage, systemImage: "exclamationmark.triangle")
      .padding()
      .background(Color("PrimaryColor"))
      .foregroundColor(Color.white)
      .cornerRadius(10)
      .padding(.top)
  }
}
