//
//  UserDefaults.swift
//  TweetSense
//
//  Created by Navin Kumar R on 28/03/24.
//
import Foundation

class DataManager {
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults.standard
    private let accessTokenKey = "accessToken"
    
    private init() {}
    
    func saveToken(_ token: String) {
        userDefaults.set(token, forKey: accessTokenKey)
    }
    
    func getToken() -> String? {
        return userDefaults.string(forKey: accessTokenKey)
    }
    
    func deleteToken() {
        userDefaults.removeObject(forKey: accessTokenKey)
    }
    
    // Add more methods for other data you want to manage with UserDefaults
}
