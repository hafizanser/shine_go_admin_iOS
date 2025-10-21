//
//  DefaultAddressManager.swift
//  Bioceuticals_IOS
//
//  Created by Usama Rafiq on 14/10/2025.
//

import Foundation

class DefaultAddressManager {
    
    static let shared = DefaultAddressManager()
    private init() {}
    
    private let key = "DefaultDeliveryAddress"
    
    func saveDefaultAddress(_ address: DeliveryAddressModel) {
        do {
            let data = try JSONEncoder().encode(address)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("Error saving default address:", error)
        }
    }
    
    func getSavedDefaultAddress() -> DeliveryAddressModel? {
        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                return try JSONDecoder().decode(DeliveryAddressModel.self, from: data)
            } catch {
                print("Error decoding default address:", error)
            }
        }
        return nil
    }
    
    func clearDefaultAddress() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
