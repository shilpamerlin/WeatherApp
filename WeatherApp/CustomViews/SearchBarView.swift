//
//  SearchBarView.swift
//  WeatherApp
//
//  Created by Shilpa Joy on 2025-01-20.
//

import SwiftUI

struct SearchBarView: View {
    @ObservedObject var viewModel: HomeWeatherViewModel
    let titleName: String
    let imageName: String
   
    var body: some View {
        HStack {
            TextField("", text: $viewModel.searchText, prompt:
                        Text(titleName))
            .font(.custom("Poppins-Regular", size: 15))
            .onSubmit {
                // fetch weather
            }
            Image(systemName: imageName)
                .imageScale(.small)
                .foregroundColor(Color.grayPrimary)
        }
        .padding()
        .background(Color.extraLightGray)
        .cornerRadius(16.0)
        
    }
}


