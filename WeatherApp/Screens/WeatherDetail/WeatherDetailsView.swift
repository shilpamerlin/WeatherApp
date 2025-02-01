//
//  WeatherDetailsView.swift
//  WeatherApp
//
//  Created by Shilpa Joy on 2025-01-20.
//

import SwiftUI

struct WeatherDetailsView: View {
    let weatherData: Weather
    let astronomyData: AstronomyResponse
    
    var body: some View {
        VStack {
            ImageDownloader(imageURL: weatherData.current.condition.iconURL)
                .frame(height: 120, alignment: .bottom)
            HStack{
                Text(weatherData.location.name)
                    .font(.custom("Poppins-Medium", size: 30))
                
                Label("", systemImage: "location.fill")
                    .font(.custom("Poppins-Medium", size: 25))
            }
            HStack {
                Text("\(String(format:"%.0f", weatherData.current.temperature))")
                    .font(.custom("Poppins-Medium", size: 70))
                VStack {
                    Text("°")
                        .font(.custom("Poppins-Medium", size: 20))
                    
                }
                .frame(height:75, alignment: .top)
            }
            Spacer()
                .frame(height: 25)
            VStack(spacing: 25) {
            HStack(spacing: 56.0) {
                WeatherPropertyView(title: "Humidity", value: "\(weatherData.current.humidity)%")
                WeatherPropertyView(title: "UV", value: "\(weatherData.current.uvIndex)")
                WeatherPropertyView(title: "Feels Like", value: "\(String(format:"%.0f", weatherData.current.feelsLikeTemperature))°")
            }
            
            HStack(spacing: 56.0) {
                WeatherPropertyView(title: "Sunrise", value: "\(astronomyData.astronomy.astronomyData.sunrise)%")
                WeatherPropertyView(title: "Sunset", value: "\(astronomyData.astronomy.astronomyData.sunset)")
                WeatherPropertyView(title: "Moonrise", value: "\(astronomyData.astronomy.astronomyData.moonrise)")
                WeatherPropertyView(title: "Moonset", value: "\(astronomyData.astronomy.astronomyData.moonset)")
            }
        }
            .padding(25)
            .background(.extraLightGray)
            .cornerRadius(16.0)
        }
    }
}

// MARK: - Subviews
struct WeatherPropertyView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.custom("Poppins-Medium", size: 12))
                .foregroundStyle(.customLightGray)
            
            Text(value)
                .font(.custom("Poppins-Medium", size: 15))
                .foregroundStyle(.gray2)
            
        }
    }
}
