//
//  RegisterScreenView.swift
//  TweetSense
//
//  Created by Navin Kumar R on 12/03/24.
//

import SwiftUI

struct RegisterScreenView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
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
                    
                    CommonTextfield(text: $email, title: "Email")
                    CommonTextfield(text: $password, title: "Password")
                    CommonTextfield(text: $confirmPassword, title: "Confirm Password")
                    PrimaryButton(title: "Register")
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

#Preview {
    RegisterScreenView()
}

struct RegisterScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreenView()
    }
}
