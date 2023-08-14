//
//  ImageSlider.swift
//  RetailStoreApp
//
//  Created by Jhonatan chavez chavez on 11/08/23.
//

import SwiftUI
import SwiftUIPager


struct ImageSlider: View {
    var imageUrls: [URL]
    @StateObject var page: Page = .first()
    
    var body: some View {
        Pager(page: page,
              data: imageUrls,
              id: \.self) { page in
            AsyncImage(url: page) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                @unknown default:
                    EmptyView()
                }
            }
        }
        .padding()
    }
}






struct ImageSlider_Previews: PreviewProvider {
    static var previews: some View {
        ImageSlider(imageUrls: [URL(string: "https://random.imagecdn.app/300/500")!,URL(string: "https://random.imagecdn.app/300/500")!])
    }
}
