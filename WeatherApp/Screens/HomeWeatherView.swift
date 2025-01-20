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
            if viewModel.searchText.isEmpty {
                EmptyStateView(message: "No City Selected", description: "Please Search For A City")
                    .padding(.top, 20)
            }
        }
    }
}

#Preview {
    HomeWeatherView()
}
