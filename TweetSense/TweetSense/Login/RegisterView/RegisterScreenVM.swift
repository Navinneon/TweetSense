//
//  RegisterScreenVM.swift
//  TweetSense
//
//  Created by Navin Kumar R on 20/03/24.
//

import Foundation
import FirebaseAuth

class RegisterScreenVM: ObservableObject {
  
  @Published var email: String = ""
  @Published var password: String = ""
  @Published var confirmPassword: String = ""
  @Published var showToast: Bool = false
  @Published var toastMessage: String = ""
  
  func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
  }
  
  func isValidPassword(_ password: String) -> Bool {
    let minPasswordLength = 6
    return password.count >= minPasswordLength
  }
  
  func createUserAndSetToastMessage(email: String, password: String) {
    if !isValidEmail(email) {
      toastMessage = "Please enter a valid email"
    } else if !isValidPassword(password) {
      toastMessage = "Please enter a valid password"
    } else if password != confirmPassword {
      toastMessage = "Please enter the confirmPassword correctly"
    } else {
      Auth.auth().createUser(withEmail: email, password: password) { [self] authResult, error in
        if let error = error {
          toastMessage = "Error creating user: \(error.localizedDescription)"
          print(toastMessage)
        } else if let _ = authResult {
          toastMessage = "User created successfully"
          print(toastMessage)
        }
      }
    }
    showToast = true
  }
}
