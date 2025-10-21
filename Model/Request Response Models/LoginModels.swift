////
////  LoginModels.swift
////  Created by Can on 15/03/2021.
////
//
import Foundation



//MARK: - LoginRequestModel
struct LoginRequestModel: Codable {
    let email: String?
    
    enum CodingKeys: String, CodingKey {
        case email
    }
}

// MARK: - LoginResponseModel
struct LoginResponseModel: Codable {
    let error: Bool
    let message: String?
    let otp: String?
    let data: String?
}

// MARK: - LoginModel
struct LoginModel: Codable {
    let token: String?
    let user: UserModel?
}

// MARK: - UserModel
struct UserModel: Codable {
    let id: Int?
    let fullName, email, imageURL: String?
    let deviceType, deviceToken: String?
    let phone: String?
    let status: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case email
        case phone
        case imageURL = "image_url"
        case deviceType = "device_type"
        case deviceToken = "device_token"
        case status
    }
}


struct SocialLoginRequestModel: Codable {
    let email: String?
    let providerType: String?
    let fullName: String?
    let providerId: String?
    let profileType: String?
    let deviceType, deviceToken: String?
    

    enum CodingKeys: String, CodingKey {
        case email
        case providerType = "provider_type"
        case fullName = "full_name"
        case providerId = "provider_id"
        case profileType = "profile_type"
        case deviceType = "device_type"
        case deviceToken = "device_token"
    }
}

struct SocialAppleLoginRequestModel: Codable {

    let providerType: String?
    let providerId: String?

    enum CodingKeys: String, CodingKey {

        case providerId = "provider_id"
        case providerType = "provider_type"
    }
}

struct SocialLoginWithSocilaIdRequestModel: Codable {
    let providerType: String?
    let providerId: String?
    let profileType: String?
    let deviceType, deviceToken: String?
    
    enum CodingKeys: String, CodingKey {
        case providerType = "provider_type"
        case providerId = "provider_id"
        case profileType = "profile_type"
        case deviceType = "device_type"
        case deviceToken = "device_token"
    }
}
