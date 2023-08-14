//
//  ProductGridItemView.swift
//  RetailStoreApp
//
//  Created by Jhonatan chavez chavez on 13/08/23.
//

import SwiftUI
 
struct ProductGridItemView: View {
    var product: Product
    
    var body: some View {
        VStack() {
            ImageSlider(imageUrls: [product.imageUrls.first!])
            .frame(width: 100, height: 120)
            .cornerRadius(8)
            
            Text(product.name)
                .font(.headline)
                .foregroundColor(.primary)
            
            Text(String(format: "$%.2f", product.price))
                .font(.subheadline)
                .foregroundColor(.green)
        }
    }
}

