//
//  EmptyStateView.swift
//  WeatherApp
//
//  Created by Shilpa Joy on 2025-01-20.
//

import SwiftUI

struct EmptyStateView: View {
    let message: String
    let description: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text(message)
                .font(.custom("Poppins-Medium", size: 30))
                .fontWeight(.semibold)
            
            Text(description)
                .font(.custom("Poppins-Regular", size: 15))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .offset(y: -50)
    }
}

#Preview {
    EmptyStateView(message: "No City Selected", description: "Please Search For A City")
}
