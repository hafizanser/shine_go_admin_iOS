//
//  CreditCardModels.swift
//  ShineGo
//
//  Created by ameer hamza on 07/04/2022.
//

import Foundation
import UIKit

struct header {
    var cardType: UIImage?
    var cardNo: String?
    var cardExpiry: String?
    var cardName: String?
}

struct CreditCardsResponseModel: Codable {
    let error: Bool
    let message: String?
    let data: [CreditCardModels]?
}

struct AddCardRequestModel: Codable {
    var token: String?
    enum CodingKeys: String, CodingKey {
        case token = "stripe_token"
    }
}

struct CreditCardResponseModel: Codable {
    let error: Bool
    let message: String?
    let data: CreditCardModels?
}
