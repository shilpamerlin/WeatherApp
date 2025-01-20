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
}
