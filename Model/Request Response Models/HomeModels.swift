//
//  HomeModels.swift
//  Gainly_IOs
//
//  Created by Usama Rafiq on 23/09/2025.
//

import Foundation

// MARK: - DashboardResponseModel
struct DashboardResponseModel: Codable {
    var error: Bool
    var message: String?
    var data: DashboardDataModel?
}

// MARK: - DashboardDataModel
struct DashboardDataModel: Codable {
    var recommendedByInfluencer: [ProductModel]?
    var featuredProducts: [ProductModel]?
    
    enum CodingKeys: String, CodingKey {
        case recommendedByInfluencer = "recommended_by_influencer"
        case featuredProducts = "featured_products"
    }
}

// MARK: - ProductModel
struct ProductModel: Codable {
    var id: Int?
    var title, description, price, fullPrice: String?
    var discountedPrice: String?
    var isFeatured, isRecommended: Int?
    var sku, shopifyID: String?
    var videoURL: String?
    var isVisible: Int?
    var stockStatus, preOrderDate: String?
    var deliveryDaysCount: Int?
    var extraTitle, discountType, discountValue: String?
    var status: Int?
    var createdAt: String?
    var updatedAt: String?
    var images: [ProductImageModel]?
    var isLiked: Bool? = true
    
    enum CodingKeys: String, CodingKey {
        case id, title, description, price
        case fullPrice = "full_price"
        case discountedPrice = "discounted_price"
        case isFeatured = "is_featured"
        case isRecommended = "is_recommended"
        case sku
        case shopifyID = "shopify_id"
        case videoURL = "video_url"
        case isVisible = "is_visible"
        case stockStatus = "stock_status"
        case preOrderDate = "pre_order_date"
        case deliveryDaysCount = "delivery_days_count"
        case extraTitle = "extra_title"
        case discountType = "discount_type"
        case discountValue = "discount_value"
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case images
    }
}

// MARK: - ProductImageModel
struct ProductImageModel: Codable {
    var id: Int?
    var productID: Int?
    var imageURL: String?
    var altText: String?
    var isPrimary: Int?
    var position: Int?
    var createdAt: String?
    var updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case productID = "product_id"
        case imageURL = "image_url"
        case altText = "alt_text"
        case isPrimary = "is_primary"
        case position
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
