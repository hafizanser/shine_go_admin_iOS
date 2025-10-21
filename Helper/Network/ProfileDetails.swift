//
//  ProfileConfig.swift
//
//  Created by Can on 2/12/18.
//  Copyright ©️ 2018 messagemuse. All rights reserved.
//

import Foundation
import os.log

struct ProfileKeys {
    
    static let token = "token"
    static let id = "id"
    static let fullName = "fullName"
    static let email = "email"
    static let imageURL = "imageURL"
    static let stripeCustomerId = "stripeCustomerId"
    static let cardId = "cardId"
    static let cardBrand = "cardBrand"
    static let nameOnCard = "nameOnCard"
    static let last4 = "last4"

}

class ProfileDetails: NSObject, NSCoding {
    
    static let instance = ProfileDetails()
    
    var id: String = ""
    var token: String = ""
    var email: String = ""
    var fullName: String = ""
    var imageURL: String = ""
    var stripeCustomerId: String = ""
    var cardId:String = ""
    var cardBrand:String = ""
    var nameOnCard:String = ""
    var last4:String = ""
    
    required convenience init?(coder aDecoder: NSCoder)
    {
        
        self.init()

        if let ids = aDecoder.decodeObject(forKey: ProfileKeys.id) as? String {
            id = ids
        }
        if let tokens = aDecoder.decodeObject(forKey: ProfileKeys.token) as? String {
            token = tokens
        }
        if let emails = aDecoder.decodeObject(forKey: ProfileKeys.email) as? String {
            email = emails
        }
        if let fullNames = aDecoder.decodeObject(forKey: ProfileKeys.fullName) as? String {
            fullName = fullNames
        }
        if let imageUrls = aDecoder.decodeObject(forKey: ProfileKeys.imageURL) as? String {
            imageURL = imageUrls
        }
        if let stripeCustomerIds = aDecoder.decodeObject(forKey: ProfileKeys.stripeCustomerId) as? String {
            stripeCustomerId = stripeCustomerIds
        }
        if let cardIds = aDecoder.decodeObject(forKey: ProfileKeys.cardId) as? String {
            cardId = cardIds
        }
        if let cardBrands = aDecoder.decodeObject(forKey: ProfileKeys.cardBrand) as? String {
            cardBrand = cardBrands
        }
        if let nameOnCards = aDecoder.decodeObject(forKey: ProfileKeys.nameOnCard) as? String {
            nameOnCard = nameOnCards
        }
        
        if let last4s = aDecoder.decodeObject(forKey: ProfileKeys.last4) as? String {
            last4 = last4s
        }
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(id, forKey: ProfileKeys.id)
        aCoder.encode(token, forKey: ProfileKeys.token)
        aCoder.encode(email, forKey: ProfileKeys.email)
        aCoder.encode(fullName, forKey: ProfileKeys.fullName)
        aCoder.encode(imageURL, forKey: ProfileKeys.imageURL)
        aCoder.encode(stripeCustomerId, forKey: ProfileKeys.stripeCustomerId)
        aCoder.encode(cardId, forKey: ProfileKeys.cardId)
        aCoder.encode(cardBrand, forKey: ProfileKeys.cardBrand)
        aCoder.encode(nameOnCard, forKey: ProfileKeys.nameOnCard)
        aCoder.encode(last4, forKey: ProfileKeys.last4)
        
    }
    
    func getProfileDetails() -> ProfileDetails?
    {
        var profileDetails : ProfileDetails?
        if let data = UserDefaults.standard.object(forKey: "profileDetailsKey") as? Data
        {
            profileDetails = NSKeyedUnarchiver.unarchiveObject(with: data) as? ProfileDetails
        }
        return profileDetails
    }
    
    func saveProfileDetails(instance:ProfileDetails)
    {
        let data = NSKeyedArchiver.archivedData(withRootObject: instance)
        UserDefaults.standard.set(data, forKey: "profileDetailsKey")
    }
    
    func removeProfileDetails(instance:ProfileDetails) -> Void {
        UserDefaults.standard.removeObject(forKey: "profileDetailsKey")
        UserDefaults.standard.synchronize()
        UserDefaults.standard.setValue(0, forKey: K.NOTIFICATION_COUNT_KEY)
    }
    
    func removeProfileOnLogout() -> Void {
        UserDefaults.standard.setValue(false, forKey: UserDefaultKeys.isUserLogin)
        UserDefaults.standard.removeObject(forKey: "profileDetailsKey")
        UserDefaults.standard.removeObject(forKey: "isSubscribed")
        UserDefaults.standard.removeObject(forKey: "subscriptionType")
        UserDefaults.standard.removeObject(forKey: "subscriptionID")
        UserDefaults.standard.synchronize()
    }
    
    func clearAllUserDefaults() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
    
}
