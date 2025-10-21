//
//  SignUpModels.swift
//  Phlex
//
//  Created by Junaid Hussain on 07/08/2023.
//

import Foundation

// MARK: - SignUpRequestModel
struct SignUpRequestModel: Codable {
    let email, password, deviceType: String?
    let fullName, deviceToken: String?

    enum CodingKeys: String, CodingKey {
        case email
        case fullName = "full_name"
        case password
        case deviceType = "device_type"
        case deviceToken = "device_token"
    }
}

// MARK: - MembershipTypesResponseModel
struct MembershipTypesResponseModel: Codable {
    let error: Bool
    let message: String?
    let data: [MembershipTypesModel]?
}

// MARK: - MembershipTypesModel
struct MembershipTypesModel: Codable {
    let id: Int?
    let name, createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
