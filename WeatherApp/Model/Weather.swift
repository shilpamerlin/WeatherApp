//
//  Weather.swift
//  WeatherApp
//
//  Created by Shilpa Joy on 2025-01-20.
//

import Foundation

struct Weather: Codable, Equatable {
    let location: Location
    let current: Current
}
    
struct Location: Codable, Equatable {
    let name: String

}

struct AstronomyResponse: Codable {
    let location: Location
    let astronomy: Astronomy
}
    
struct Astronomy: Codable, Equatable {
    let astronomyData: Astro
    enum CodingKeys: String, CodingKey {
        case astronomyData = "astro"
    }
}

struct Astro: Codable, Equatable {
    let sunrise: String
    let sunset: String
    let moonrise: String
    let moonset: String

}

struct Current: Codable, Equatable {
    let temperature: Double
    let condition: Condition
    let humidity: Int
    let uvIndex: Double
    let feelsLikeTemperature: Double
    enum CodingKeys: String, CodingKey {
        case temperature = "temp_c"
        case condition
        case humidity
        case uvIndex = "uv"
        case feelsLikeTemperature = "feelslike_c"
    }
}
        
struct Condition: Codable, Equatable {
    let text: String
    let iconURL: String
    enum CodingKeys: String, CodingKey {
        case text
        case iconURL = "icon"
    }
}
