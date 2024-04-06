//
//  HomeViewModel.swift
//  TweetSense
//
//  Created by Navin Kumar R on 05/04/24.
//

import Foundation
import Firebase

class HomeViewModel: ObservableObject {
  
  @Published var showAlert: Bool = false
  @Published var isLoggedOut = false
  
  func logout() {
    do {
      try Auth.auth().signOut()
      DataManager.shared.deleteToken()
      isLoggedOut = true
    } catch {
      print("Sign out error")
    }
  }
}
