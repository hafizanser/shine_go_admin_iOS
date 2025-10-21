//
//  privacyPolicyCell.swift
//  Lisbon_IOS
//
//  Created by Ahmad Malik on 10/7/25.
//

import UIKit

class privacyPolicyCell: UITableViewCell {


    var  privacyPolicyButtonTapped:(()->())?
    var termsAndConditionButtonTapped:(()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
          setupUI()
    }

    //MARK: - Helper Functions
    private func setupUI(){
        
    }
    
    //MARK: - IBActions
    @IBAction func privacyPolicyButtonWasPressed(_ sender: Any) {
        privacyPolicyButtonTapped?()
    }
    
    @IBAction func termsAndConditionButtonWasPressed(_ sender: Any) {
        termsAndConditionButtonTapped?()
    }
    
}

