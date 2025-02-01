//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Shilpa Joy on 2025-01-20.
//

import XCTest
@testable import WeatherApp

@MainActor
final class HomeWeatherViewModelTests: XCTestCase {
    var viewModel: HomeWeatherViewModel!
    var mockWeatherService: MockWeatherService!
    
    override func setUp() {
        super.setUp()
        mockWeatherService = MockWeatherService()
        viewModel = HomeWeatherViewModel(weatherService: mockWeatherService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockWeatherService = nil
        super.tearDown()
    }
    
    func testLoadUserDefaults_withSavedCity() {
        StorageService.shared.saveSelectedCity("Toronto")
        viewModel.loadCityFromUserDefault()
        XCTAssertEqual(viewModel.selectedCity, "Toronto")
    }
    
    func testFetchWeather_successfulResponse() async throws {
        let mockWeather = Weather(location: Location(name: "Toronto"), current: Current(temperature: -2, condition: Condition(text: "Windy", iconURL: "httsp://icon.com"), humidity: 20, uvIndex: 12, feelsLikeTemperature: -10))
        mockWeatherService.mockWeatherData = mockWeather
        
        let weather = try await mockWeatherService.fetchWeather(for: "Toronto")
        
        
        XCTAssertEqual(weather.location.name, "Toronto")
        XCTAssertEqual(weather.current.temperature, -2)
        XCTAssertEqual(weather.current.condition.text, "Windy")
        XCTAssertEqual(weather.current.humidity, 20)
        XCTAssertEqual(weather.current.uvIndex, 12)
        XCTAssertEqual(weather.current.feelsLikeTemperature, -10)
    }
    
}

//MARK: - Mock Service

final class MockWeatherService: WeatherServiceProtocol {

    
    var mockWeatherData: Weather?
    var shouldThrowError = false
    
    func fetchWeather(for city: String) async throws -> Weather {
        guard let weather = mockWeatherData else {
            throw WeatherError.invalidData
        }
        return weather
    }
}
