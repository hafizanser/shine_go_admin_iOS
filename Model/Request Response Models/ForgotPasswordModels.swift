//
//  ForgotPasswordModels.swift
//  Phlex
//
//  Created by Junaid Hussain on 07/08/2023.
//

import Foundation

// MARK: - ForgotPasswordRequestModel
struct ForgotPasswordRequestModel: Codable {
    let email: String?
    
}


// MARK: - ForgotPasswordResponseModel
struct ForgotPasswordResponseModel: Codable {
    let error: Bool
    let message: String?
}

// MARK: - GenericReponseModel
struct GenericReponseModel: Codable {
    let error: Bool
    let message: String?
}




// MARK: - ChangePasswordRequestModel
struct ChangePasswordRequestModel: Codable {
    let newPassword, newPasswordConfirmation: String?

    enum CodingKeys: String, CodingKey {
        case newPassword = "new_password"
        case newPasswordConfirmation = "new_password_confirmation"
    }
}


// MARK: - UpdatePasswordRequestModel
struct UpdatePasswordRequestModel: Codable {
    let currentPassword, newPassword: String?

    enum CodingKeys: String, CodingKey {
        case currentPassword = "current_password"
        case newPassword = "password"
    }
}
