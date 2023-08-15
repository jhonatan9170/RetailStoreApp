//
//  ProductResponse.swift
//  RetailStoreApp
//
//  Created by Jhonatan chavez chavez on 14/08/23.
//


import Foundation

// MARK: - ProductResponse
struct ProductResponse: Codable {
    let codigo, mensaje, folio, advertencia: String
    let resultado: Resultado
}

// MARK: - Resultado
struct Resultado: Codable {
    let paginacion: Paginacion
    let categoria: String
    let productos: [Producto]
}

// MARK: - Paginacion
struct Paginacion: Codable {
    let pagina, totalPaginas, totalRegistros, totalRegistrosPorPagina: Int
}

// MARK: - Producto
struct Producto: Codable {
    let id: String
    let idLinea: Int
    let codigoCategoria: CodigoCategoria
    let idModalidad, relevancia: Int
    let lineaCredito: String
    let pagoSemanalPrincipal, plazoPrincipal: Int
    let disponibleCredito: Bool
    let abonosSemanales: [AbonosSemanale]
    let sku, nombre: String
    let urlImagenes: [String]
    let precioRegular: Int
    let precioFinal, porcentajeDescuento: Double
    let descuento: Bool
    let precioCredito, montoDescuento: Double
}

// MARK: - AbonosSemanale
struct AbonosSemanale: Codable {
    let plazo, montoAbono, montoDescuentoAbono, montoUltimoAbono: Int
    let montoFinalCredito, idPromocion, montoDescuentoElektra, montoDescuentoBanco: Int
    let precio, montoAbonoDigital: Int
}

enum CodigoCategoria: String, Codable {
    case c = "C"
    case ma = "MA"
    case tl = "TL"
}

extension Producto {
    func toProduct() -> Product {
        let product = Product(name: self.nombre, description: "", categoria: self.codigoCategoria.rawValue, price: self.precioFinal,
                              regularPrice: self.precioRegular, discount: Int(self.porcentajeDescuento),
                              imageUrls: self.urlImagenes.map{URL(string: $0)!})
        return product
    }
}
