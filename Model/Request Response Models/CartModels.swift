//
//  CartModels.swift
//  Bioceuticals_IOS
//
//  Created by Usama Rafiq on 13/10/2025.
//

import Foundation

// MARK: - getCartResponseModel
struct getCartResponseModel: Codable {
    var error: Bool
    var message: String?
    var data: [CartItemModel]?
    let total: String?
}

// MARK: - CartItemModel
struct CartItemModel: Codable {
    var id: Int?
    var userID: Int?
    var productID: Int?
    var quantity: Int?
    var price: String?
    var total: Int?
    var notes: String?
    var status: String?
    var createdAt: String?
    var updatedAt: String?
    var product: ProductModel?

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case productID = "product_id"
        case quantity
        case price
        case total
        case notes
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case product
    }
}


// MARK: - QuantityUpdateRequestModel
struct QuantityUpdateRequestModel: Codable {
    var quantity: String?
}

// MARK: - AddToCartRequestModel
struct AddToCartRequestModel: Codable {
    var quantity: String?
    var productID: String?
    
    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case quantity
    }
}




// MARK: - UpdateCartItemResponseModel
struct UpdateCartItemResponseModel: Codable {
    var error: Bool
    var message: String?
    var data: CartUpdateDataModel?
}

// MARK: - CartUpdateDataModel
struct CartUpdateDataModel: Codable {
    var id: Int?
    var userID: Int?
    var productID: Int?
    var quantity: String?
    var price: String?
    var total: Int?
    var notes: String?
    var status: String?
    var createdAt: String?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case productID = "product_id"
        case quantity
        case price
        case total
        case notes
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
