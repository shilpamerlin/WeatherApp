//
//  SearchResultView.swift
//  WeatherApp
//
//  Created by Shilpa Joy on 2025-01-20.
//

import SwiftUI

struct SearchResultView: View {
    @ObservedObject var viewModel: HomeWeatherViewModel
    
    var body: some View {
        HStack(alignment: .center) {
            if let data = viewModel.weatherData  {
                CityWeatherView(cityName: data.location.name, currentTemperature: data.current.temperature)
                Spacer()
                ImageDownloader(imageURL: data.current.condition.iconURL)
                    .frame(height: 85, alignment: .center)
            } else {
                Text("Missing Weather Information")
                    .font(.custom("Poppins-Medium", size: 20))
            }
        }
        .padding(20.0)
        .background(.extraLightGray)
        .cornerRadius(16.0)
        .onTapGesture {
            guard (viewModel.weatherData?.location.name) != nil else {
                return
            }
            viewModel.searchText = ""
            endEditing()
        }
    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}
    
    // MARK: - Subviews
    
struct CityWeatherView: View {
    let cityName: String
    let currentTemperature: Double
    
    var body: some View {
        VStack() {
            Text(cityName)
                .font(.custom("Poppins-Medium", size: 20))
            HStack {
                Text("\(String(format:"%.0f", currentTemperature))")
                    .font(.custom("Poppins-Medium", size: 60))
                VStack {
                    Text("°")
                        .font(.custom("Poppins-Medium", size: 20))
                }
                .frame(height:65, alignment: .top)
            }
            .padding(.top, -20)
        }
    }
}



#Preview {
    var viewModel = HomeWeatherViewModel()
    SearchResultView(viewModel: viewModel)
}
