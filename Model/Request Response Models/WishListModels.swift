//
//  WishListModels.swift
//  Bioceuticals_IOS
//
//  Created by Usama Rafiq on 13/10/2025.
//

import Foundation

// MARK: - WishlistResponseModel
struct WishlistResponseModel: Codable {
    var error: Bool
    var message: String?
    var data: [WishlistItemModel]?
}

// MARK: - WishlistItemModel
struct WishlistItemModel: Codable {
    var id: Int?
    var userID: Int?
    var productID: Int?
    var createdAt: String?
    var updatedAt: String?
    var product: ProductModel?
    var isLiked: Bool? = true

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case productID = "product_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case product
    }
}

// MARK: - ProductWishListModel
struct ProductWishListModel: Codable {
    var id: Int?
    var title: String?
    var description: String?
    var price: String?
    var isFeatured: Int?
    var isRecommended: Int?
    var sku: String?
    var shopifyID: String?
    var videoURL: String?
    var status: Int?
    var createdAt: String?
    var updatedAt: String?
    var images: [ProductImageModel]?

    enum CodingKeys: String, CodingKey {
        case id, title, description, price, status, images
        case isFeatured = "is_featured"
        case isRecommended = "is_recommended"
        case sku
        case shopifyID = "shopify_id"
        case videoURL = "video_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}



// MARK: - AddWishlistRequestModel
struct AddWishlistRequestModel: Codable {
    var productID: String?

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
    }
}


// MARK: - AddWishlistResponseModel
struct AddWishlistResponseModel: Codable {
    var error: Bool
    var message: String?
    var data: WishlistItemModel?
}


// MARK: - RemoveFromWishlistResponseModel
struct RemoveFromWishlistResponseModel: Codable {
    var error: Bool
    var message: String?
}
