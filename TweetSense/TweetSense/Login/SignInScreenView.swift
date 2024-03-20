//
//  SignInScreenView.swift
//  TweetSense
//
//  Created by Navin Kumar R on 12/03/24.
//

import SwiftUI

struct SignInScreenView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        ZStack {
            Color("BgColor").edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                
                VStack {
                    Text("Sign In")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 30)
                    
                    CommonTextfield(text: $email, title: "Email")
                    CommonTextfield(text: $password, title: "Password")
                    PrimaryButton(title: "SignIn")
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
    }
}

struct SignInScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreenView()
    }
}


struct SocalLoginButton: View {
    var image: Image
    var text: Text
    
    var body: some View {
        HStack {
            image
                .padding(.horizontal)
            Spacer()
            text
                .font(.title2)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(50.0)
        .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
    }
    
    //SocalLoginButton(image: Image(uiImage: #imageLiteral(resourceName: "apple")), text: Text("Sign in with Apple"))
    //
}
