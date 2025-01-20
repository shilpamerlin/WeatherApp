//
//  ImageLoader.swift
//  WeatherApp
//
//  Created by Shilpa Joy on 2025-01-20.
//

import SwiftUI

struct ImageDownloader: View {
    let imageURL: String
    
    var body: some View {
        AsyncImage(url: URL(string: "https:\(imageURL)")){ image in
            image.resizable()
            .aspectRatio(contentMode: .fit)
        } placeholder: {
            Image(systemName: "photo")
        }
    }
}

