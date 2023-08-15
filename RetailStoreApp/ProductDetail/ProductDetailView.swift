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
                ImageSlider(imageUrls: product.imageUrls).frame(height: 300.0)
                Text(product.name)
                    .font(.title)
                    .padding()
                
                Spacer()
                if product.discount != 0 {
                    HStack() {
                        Text("-\(product.discount)% ").foregroundColor(.red).background(.yellow)
                        Text(Double(product.regularPrice).toMonedaFormat()).strikethrough()
                    }
                }
                Text(product.price.toMonedaFormat())
                    .font(.title)
                    .foregroundColor(.green)
                    .padding(.bottom)
                
            }
            
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
    static let product = Product(name: "Motocicleta", description: "", categoria: "d", price: 30.0, regularPrice: 30, discount: 20, imageUrls: [])
    
    static var previews: some View {
        ProductDetailView(product: product)
    }
}
