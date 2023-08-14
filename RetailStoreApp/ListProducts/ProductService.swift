//
//  ProductService.swift
//  RetailStoreApp
//
//  Created by Jhonatan chavez chavez on 14/08/23.
//

import Foundation

class ProductService {
    func loadProducts(completion: @escaping ([Product]?) -> Void) {
        let urlString = "http://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/sapp/productos/plp/1/ad2fdd4bbaec4d15aa610a884f02c91a"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error: \(error)")
                completion(nil)
                return
            }
            
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(ProductResponse.self, from: data)
                    completion(response.resultado.productos.map{$0.toProduct()})
                } catch {
                    print("JSON decoding error: \(error)")
                    completion(nil)
                }
            }
        }.resume()
    }
}
