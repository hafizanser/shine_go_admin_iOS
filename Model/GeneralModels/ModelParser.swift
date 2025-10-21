//
//  ModelParser.swift
//  MYBT
//
//  Created by Hafiz Anser on 15/03/2021.
//

import Foundation

class ModelParser {
    
    static func parseLoginModel(responseModel:VerifyOTPResponseModel) -> Void {
        if let profile = ProfileDetails.instance.getProfileDetails() {
            
            profile.token = responseModel.token ?? ""
            profile.id = "\(responseModel.data?.id ?? 0)"
            profile.imageURL = responseModel.data?.imageURL ?? ""
            profile.email = responseModel.data?.email ?? ""
            profile.fullName = responseModel.data?.fullName ?? ""
            profile.stripeCustomerId = responseModel.data?.stripeCustomerID ?? ""
            profile.cardId = "\(responseModel.data?.defaultCard?.cardDetails?.id ?? "")"
            profile.cardBrand = "\(responseModel.data?.defaultCard?.cardDetails?.brand ?? "")"
            profile.nameOnCard = "\(responseModel.data?.defaultCard?.cardDetails?.name ?? "")"
            profile.last4 = "\(responseModel.data?.defaultCard?.cardDetails?.last4 ?? "")"
            
            UserDefaults.standard.setValue(true, forKey: UserDefaultKeys.isUserLogin)

            ProfileDetails.instance.saveProfileDetails(instance: profile)
        } else {
            let profile = ProfileDetails.instance
            
            profile.token = responseModel.token ?? ""
            profile.id = "\(responseModel.data?.id ?? 0)"
            profile.imageURL = responseModel.data?.imageURL ?? ""
            profile.email = responseModel.data?.email ?? ""
            profile.fullName = responseModel.data?.fullName ?? ""
            profile.stripeCustomerId = responseModel.data?.stripeCustomerID ?? ""
            profile.cardId = "\(responseModel.data?.defaultCard?.cardDetails?.id ?? "")"
            profile.cardBrand = "\(responseModel.data?.defaultCard?.cardDetails?.brand ?? "")"
            profile.nameOnCard = "\(responseModel.data?.defaultCard?.cardDetails?.name ?? "")"
            profile.last4 = "\(responseModel.data?.defaultCard?.cardDetails?.last4 ?? "")"
            
            UserDefaults.standard.setValue(true, forKey: UserDefaultKeys.isUserLogin)
            ProfileDetails.instance.saveProfileDetails(instance: profile)
        }
    }
    
    static func parseLoginToken(responseModel:LoginModel) -> Void {
        if let profile = ProfileDetails.instance.getProfileDetails() {
            
            profile.token = responseModel.token ?? ""

            ProfileDetails.instance.saveProfileDetails(instance: profile)
        } else {
            let profile = ProfileDetails.instance
            
            profile.token = responseModel.token ?? ""

            ProfileDetails.instance.saveProfileDetails(instance: profile)
        }
        
    }

}
