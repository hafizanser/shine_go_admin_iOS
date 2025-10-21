//
//  UpdateUserModels.swift
//  Gainly_IOs
//
//  Created by Usama Rafiq on 22/09/2025.
//

import Foundation

// MARK: - UpdateProfileRequestModel
struct UpdateProfileRequestModel: Codable {
    let fullName: String?
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
    }
}


// MARK: - UpdateCountryResponseModel
struct UpdateProfileResponseModel: Codable {
    let success: Bool
    let message: String?
}
