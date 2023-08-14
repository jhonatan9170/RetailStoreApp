//
//  ProductDetail.swift
//  RetailStoreApp
//
//  Created by Jhonatan chavez chavez on 11/08/23.
//

import SwiftUI

struct ProductDetailView: View {
    @State var product: Product? = nil
    @State private var isShowingProductList = false

    var body: some View {
            VStack {
                if let product = product {
                    ImageSlider(imageUrls: product.imageUrls)
                    Text(product.name)
                        .font(.title)
                        .padding(.bottom, 10)
                    
                    Text(product.description)
                        .font(.body)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    Text(String(format: "$%.2f", product.price))
                        .font(.title)
                        .foregroundColor(.green)
                    .padding()}
                Button(action: {
                    isShowingProductList = true
                }, label: {
                    Text("Cargar Productos")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                }).sheet(isPresented: $isShowingProductList, content: {
                    ProductListView(selectedProduct: $product)
                }).padding(.bottom)}
        }
    }


struct ProductDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}
