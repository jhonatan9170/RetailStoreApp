//
//  Product.swift
//  RetailStoreApp
//
//  Created by Jhonatan chavez chavez on 14/08/23.
//

import Foundation

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let price: Double
    let imageUrls: [URL]
}
