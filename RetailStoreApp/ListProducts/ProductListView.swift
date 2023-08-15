//
//  ListProductsView.swift
//  RetailStoreApp
//
//  Created by Jhonatan chavez chavez on 12/08/23.
//

import SwiftUI

struct ProductListView: View {
    
    @StateObject var viewModel = ProductListViewModel()
    @Environment(\.dismiss) var dismiss
    @Binding var selectedProduct: Product?
    
    var body: some View {
        ScrollView {
            if viewModel.isLoading {
                ProgressView()
            } else {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(viewModel.products) { product in
                        Button {
                            selectedProduct = product
                            dismiss()
                        } label: {
                            ProductGridItemView(product: product).padding().border(.black, width: 0.5)
                            
                        }
                    }
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.loadProducts()
        }
    }
}




struct ListProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(selectedProduct: .constant(nil))
    }
}


