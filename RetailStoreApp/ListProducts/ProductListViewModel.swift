//
//  ListProductsViewModel.swift
//  RetailStoreApp
//
//  Created by Jhonatan chavez chavez on 13/08/23.
//

import SwiftUI

class ProductListViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var isLoading = false
    let productService = ProductService()
    
    func loadProducts() {
        isLoading = true
        productService.loadProducts { [weak self] products in
            if let products = products {
                DispatchQueue.main.async {
                    self?.isLoading = false
                    self?.products = products
                }
            }
        }
    }
}
