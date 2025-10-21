//
//  CategoryModels.swift
//  Bioceuticals_IOS
//
//  Created by Usama Rafiq on 13/10/2025.
//

import Foundation

// MARK: - CategoriesResponseModel
struct CategoriesResponseModel: Codable {
    var error: Bool
    var message: String?
    var data: [CategoryModel]?
}

// MARK: - CategoryModel
struct CategoryModel: Codable {
    var id: Int?
    var name: String?
    var description: String?
    var imageURL: String?

    enum CodingKeys: String, CodingKey {
        case id, name, description
        case imageURL = "image_url"
    }
}

// MARK: - CategoryProductsResponseModel
struct CategoryProductsResponseModel: Codable {
    let error: Bool
    let message: String?
    let category: CategoryModel?
    let count: Int?
    let data: [ProductModel]?
}
