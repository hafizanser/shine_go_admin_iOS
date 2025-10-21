//
//  GeneralModels.swift
//  MYBT
//
//  Created by Can on 15/03/2021.
//

import Foundation

struct CustomError: LocalizedError {
    var description: String?

    init(description: String) {
        self.description = description
    }
}

struct NotSuccessModel:Codable {
    let isError: Bool
    let message: String?
    let is_subscribed: Int?
}


// MARK: - PurchasingEndResponseModel
struct PurchasingEndResponseModel: Codable {
    let error: Bool
    let message: String?
    let is_subscribed: Int?

    enum CodingKeys: String, CodingKey {
        case error
        case is_subscribed = "is_subscribed"
        case message
    }
}

