//
//  HomeWeatherViewModel.swift
//  WeatherApp
//
//  Created by Shilpa Joy on 2025-01-20.
//

import Foundation

@MainActor
final class HomeWeatherViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var weatherData: Weather?
    @Published var selectedCity = ""
    @Published var validCity = true
    private let weatherService: WeatherServiceProtocol
    @Published var astronomyData: AstronomyResponse?
    
       
       init(weatherService: WeatherServiceProtocol) {
           self.weatherService = weatherService
       }
    
    func fetchWeather(for city: String) {
        Task {
            do {
                let fetchedWeather = try await weatherService.fetchWeather(for: city)
                if fetchedWeather.location.name.lowercased() != city.lowercased() {
                    print("No weather data found for '\(city)'. Please check the spelling and try again.")
                    validCity = false
                    return
                }
                validCity = true
                            weatherData = fetchedWeather
                            selectedCity = fetchedWeather.location.name
                saveCity(city: selectedCity)
                
            } catch WeatherError.invalidURL {
                print("There was an issue connecting to the server.")
            }
            catch WeatherError.invalidResponse {
                print("Invalid response from the server. Please try again later")
            }
            catch WeatherError.invalidData {
                print("The data received from the server was invalid. Please contact support.")
            }
        }
    }
    
    func fetchAstronomyData(for city: String) {
        Task {
            do {
                astronomyData = try await weatherService.fetchAstronomyData(for: city)
                
            } catch WeatherError.invalidURL {
                print("There was an issue connecting to the server.")
            }
            catch WeatherError.invalidResponse {
                print("Invalid response from the server. Please try again later")
            }
            catch WeatherError.invalidData {
                print("The data received from the server was invalid. Please contact support.")
            }
        }
    }
    
    func loadCityFromUserDefault() {
        selectedCity = StorageService.shared.getSelectedCity() ?? ""
        fetchWeather(for: selectedCity)
        fetchAstronomyData(for: selectedCity)
    }
    
    func saveCity(city: String) {
        selectedCity = city
        StorageService.shared.saveSelectedCity(city)
    }
}
