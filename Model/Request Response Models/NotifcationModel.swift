

//
//  Untitled.swift
//  ShineGo_Admin_iOS
//
//  Created by Malik on 25/10/2025.
//
import Foundation

struct NotificationBookingModel: Codable {
    let orderId: Int?
    

    enum CodingKeys: String, CodingKey {
        case orderId = "order_id"
    }
}

struct NotificationModel: Codable {
    let notificationType: String?

    enum CodingKeys: String, CodingKey {
        case notificationType = "notification_type"
    }
}
