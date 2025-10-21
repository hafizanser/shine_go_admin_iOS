//
//  OTPModels.swift
//  ikincieldenal_IOS
//
//  Created by Usama Rafiq on 08/10/2024.
//

import Foundation

// MARK: - OTPResponseModel
struct OTPResponseModel: Codable {
    let error: Bool
    let message, otp, data: String?
}

// MARK: - OTPRequestModel
struct OTPRequestModel: Codable {
    let email: String?

    enum CodingKeys: String, CodingKey {
        case email
    }
}


//MARK: - OTPRequestModel
struct VerifyOTPRequestModel: Codable {
    let email, otp: String?
    
    enum CodingKeys: String, CodingKey {
        case email
        case otp
    }
}


// MARK: - VerifyOTPResponseModel
struct VerifyOTPResponseModel: Codable {
    var error: Bool
    var message: String?
    var token: String?
    var data: VerifyOTPMainModel?
}

// MARK: - VerifyOTPMainModel
struct VerifyOTPMainModel: Codable {
    var id: Int?
    var fullName: String?
    var email: String?
    var imageURL: String?
    var stripeCustomerID: String?
    var defaultCard: CreditCardModels?

    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case email
        case imageURL = "image_url"
        case stripeCustomerID = "stripe_customer_id"
        case defaultCard = "default_card"
    }
}


// MARK: - CreditCardModels
struct CreditCardModels: Codable {
    var id: Int?
    var stripeToken: String?
    var isDefault: Bool?
    var cardDetails: CardDetails?

    enum CodingKeys: String, CodingKey {
        case id
        case stripeToken = "stripe_token"
        case isDefault = "is_default"
        case cardDetails = "card_details"
    }
}

// MARK: - CardDetails
struct CardDetails: Codable {
    var id: String?
    var object: String?
    var addressCity: String?
    var addressCountry: String?
    var addressLine1: String?
    var addressLine1Check: String?
    var addressLine2: String?
    var addressState: String?
    var addressZip: String?
    var addressZipCheck: String?
    var allowRedisplay: String?
    var brand: String?
    var country: String?
    var customer: String?
    var cvcCheck: String?
    var dynamicLast4: String?
    var expMonth: Int?
    var expYear: Int?
    var fingerprint: String?
    var funding: String?
    var last4: String?
    var metadata: [String]?
    var name: String?
    var regulatedStatus: String?
    var tokenizationMethod: String?
    var wallet: String?

    enum CodingKeys: String, CodingKey {
        case id, object
        case addressCity = "address_city"
        case addressCountry = "address_country"
        case addressLine1 = "address_line1"
        case addressLine1Check = "address_line1_check"
        case addressLine2 = "address_line2"
        case addressState = "address_state"
        case addressZip = "address_zip"
        case addressZipCheck = "address_zip_check"
        case allowRedisplay = "allow_redisplay"
        case brand, country, customer
        case cvcCheck = "cvc_check"
        case dynamicLast4 = "dynamic_last4"
        case expMonth = "exp_month"
        case expYear = "exp_year"
        case fingerprint, funding, last4, metadata, name
        case regulatedStatus = "regulated_status"
        case tokenizationMethod = "tokenization_method"
        case wallet
    }
}
