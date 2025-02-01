//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Shilpa Joy on 2025-01-20.
//

import Foundation

protocol WeatherServiceProtocol {
    func fetchWeather(for city: String) async throws -> Weather
    func fetchAstronomyData(for city: String) async throws  -> AstronomyResponse
}

class WeatherService: WeatherServiceProtocol {
    
    private let apiKey = "572f53f268ea4f46a6800351251801"
    static  let baseURL = "https://api.weatherapi.com/v1"
    private let currentWeatherURL = baseURL + "/current.json"
    
    private let astroURL = baseURL + "/astronomy.json"
    
    
    func fetchWeather(for city: String) async throws -> Weather {
        guard let url = URL(string: "\(currentWeatherURL)?key=\(apiKey)&q=\(city)") else {
            throw WeatherError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw WeatherError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(Weather.self, from: data)
            return decodedResponse
        }
        catch {
            throw WeatherError.invalidData
        }
    }
    
    func fetchAstronomyData(for city: String) async throws -> AstronomyResponse {
        guard let url = URL(string: "\(astroURL)?key=\(apiKey)&q=\(city)") else {
            throw WeatherError.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw WeatherError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(AstronomyResponse.self, from: data)
            return decodedResponse
        }
        catch {
            throw WeatherError.invalidData
        }
    }
}
