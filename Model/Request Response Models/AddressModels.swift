//
//  AddressModels.swift
//  Bioceuticals_IOS
//
//  Created by Usama Rafiq on 14/10/2025.
//

import Foundation

// MARK: - DeliveryAddressesResponseModel
struct DeliveryAddressesResponseModel: Codable {
    let error: Bool
    let message: String?
    let data: [DeliveryAddressModel]?
}

// MARK: - DeliveryAddressModel
struct DeliveryAddressModel: Codable {
    let id: Int?
    let userId: Int?
    let firstName: String?
    let lastName: String?
    let mobile: String?
    let fullAddress: String?
    let locationTag: String?
    let isDefault: Int?
    let createdAt: String?
    let updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id, mobile
        case userId = "user_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case fullAddress = "full_address"
        case locationTag = "location_tag"
        case isDefault = "is_default"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}


// MARK: - UpdateDeliveryAddressesRequestModel
struct UpdateDeliveryAddressesRequestModel: Codable {
    let firstName: String?
    let lastName: String?
    let mobile: String?
    let fullAddress: String?
    let locationTag: String?
    let isDefault: Int?
    
    enum CodingKeys: String, CodingKey {
        case mobile
        case firstName = "first_name"
        case lastName = "last_name"
        case fullAddress = "full_address"
        case locationTag = "location_tag"
        case isDefault = "is_default"
    }
}

// MARK: - UpdateDeliveryAddressesResponseModel
struct UpdateDeliveryAddressesResponseModel: Codable {
    let error: Bool
    let message: String?
    let data: DeliveryAddressModel?
}
