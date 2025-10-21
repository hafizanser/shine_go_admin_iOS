//
//  DefaultCardManager.swift.swift
//  Bioceuticals_IOS
//
//  Created by Usama Rafiq on 14/10/2025.
//

import Foundation

final class DefaultCardManager {
    static let shared = DefaultCardManager()
    
    private init() {
        loadDefaultCard()
    }
    
    private var defaultCard: CreditCardModels?
    
    func saveDefaultCard(_ card: CreditCardModels) {
        defaultCard = card
        
        // Encode to Data and save
        if let encoded = try? JSONEncoder().encode(card) {
            UserDefaults.standard.set(encoded, forKey: "defaultCard")
        }
    }
    
    func getDefaultCard() -> CreditCardModels? {
        return defaultCard
    }
    
    func clearDefaultCard() {
        defaultCard = nil
        UserDefaults.standard.removeObject(forKey: "defaultCard")
    }
    
    private func loadDefaultCard() {
        if let data = UserDefaults.standard.data(forKey: "defaultCard"),
           let card = try? JSONDecoder().decode(CreditCardModels.self, from: data) {
            defaultCard = card
        }
    }
}
