//
//  StorageService.swift
//  WeatherApp
//
//  Created by Shilpa Joy on 2025-01-20.
//

import Foundation

final class StorageService {
    static let shared = StorageService()
    private let selectedCityKey = "selectedCityKey"
    
    private init() {}
    
    func saveSelectedCity(_ city: String) {
            UserDefaults.standard.set(city, forKey: selectedCityKey)
        }
    func getSelectedCity() -> String? {
          return UserDefaults.standard.string(forKey: selectedCityKey)
      }
    
}

