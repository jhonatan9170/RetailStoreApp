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
    let categoria:String
    let price: Double
    let regularPrice: Int
    let discount: Int
    let imageUrls: [URL]    
}

extension Double {
    func toMonedaFormat() -> String {
        return String(format: "$%.2f", self)
    }
}
