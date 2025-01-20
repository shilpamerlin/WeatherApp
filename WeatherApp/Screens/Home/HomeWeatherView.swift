//
//  ContentView.swift
//  WeatherApp
//
//  Created by Shilpa Joy on 2025-01-20.
//

import SwiftUI

struct HomeWeatherView: View {
    @StateObject var viewModel = HomeWeatherViewModel()
    
    var body: some View {
        VStack {
            SearchBarView(viewModel: viewModel, titleName: "Search Location",imageName: "magnifyingglass")
            
            if !viewModel.searchText.isEmpty {
                searchResultView()
                
            } else if viewModel.selectedCity.isEmpty {
                
                EmptyStateView(message: "No City Selected", description: "Please Search For A City")
                    .padding(.top, 20)
            } else if let weatherData = viewModel.weatherData {
                
                WeatherDetailsView(weatherData: weatherData)
                    .padding(.top, 20)
            } else {
                EmptyStateView(message: "No City Found", description: "Please check the city name again")
                    .padding(.top, 20)
            }
        }
        .padding(25)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .onAppear {
            viewModel.loadCityFromUserDefault()
        }
        
    }
    @ViewBuilder
    private func searchResultView() -> some View {
        if viewModel.validCity {
            SearchResultView(viewModel: viewModel)
                .padding(.top, 20)
        } else {
            EmptyStateView(message: "No City Found", description: "Please check the city name again")
        }
    }
}

#Preview {
    HomeWeatherView()
}
