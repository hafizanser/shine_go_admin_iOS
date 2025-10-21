//
//  OrdersModels.swift
//  Bioceuticals_IOS
//
//  Created by Usama Rafiq on 14/10/2025.
//

import Foundation

// MARK: - CreateOrderRequestModel
struct CreateOrderRequestModel: Codable {
    var paymentType: String?
    var creditCardId: String?
    var reason: String?
    var notes: String?
    var deliveryAddressId: String?
    var deliveryCharges: String?
    var phoneNumber: String?

    enum CodingKeys: String, CodingKey {
        case paymentType = "payment_type"
        case creditCardId = "credit_card_id"
        case reason, notes
        case deliveryAddressId = "delivery_address_id"
        case deliveryCharges = "delivery_charges"
        case phoneNumber = "phone"
    }
}


// MARK: - CreateOrderResponseModel
struct CreateOrderResponseModel: Codable {
    let error: Bool
    let message: String?
    let data: CreateOrderModel?
}

// MARK: - CreateOrderModel
struct CreateOrderModel: Codable {
    let userId: Int?
    let totalAmount: Double?
    let total: Double?
    let status: String?
    let paymentStatus: String?
    let paymentType: String?
    let phoneNumber: String?
    let creditCardId: String?
    let deliveryAddressId: String?
    let deliveryCharges: String?
    let stripeChargeId: String?
    let reason: String?
    let notes: String?
    let updatedAt: String?
    let createdAt: String?
    let id: Int?
    let items: [CreateOrderItemModel]?

    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case totalAmount = "total_amount"
        case total, status
        case paymentStatus = "payment_status"
        case paymentType = "payment_type"
        case phoneNumber = "phone"
        case creditCardId = "credit_card_id"
        case deliveryAddressId = "delivery_address_id"
        case deliveryCharges = "delivery_charges"
        case stripeChargeId = "stripe_charge_id"
        case reason, notes, updatedAt = "updated_at", createdAt = "created_at", id, items
    }
}

// MARK: - CreateOrderItemModel
struct CreateOrderItemModel: Codable {
    let id: Int?
    let orderId: Int?
    let productId: Int?
    let quantity: Int?
    let price: String?
    let total: String?
    let status: String?
    let stripeRefundId: String?
    let reason: String?
    let createdAt: String?
    let updatedAt: String?
    let product: ProductModel?

    enum CodingKeys: String, CodingKey {
        case id
        case orderId = "order_id"
        case productId = "product_id"
        case quantity, price, total, status
        case stripeRefundId = "stripe_refund_id"
        case reason, createdAt = "created_at", updatedAt = "updated_at", product
    }
}
