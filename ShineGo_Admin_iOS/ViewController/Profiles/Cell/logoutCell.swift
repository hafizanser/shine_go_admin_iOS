//
//  logoutCell.swift
//  Lisbon_IOS
//
//  Created by Ahmad Malik on 10/7/25.
//

import UIKit

class logoutCell: UITableViewCell {

    var logoutButtonTapped:(()->())?
    var deleteMyAccountButtonTapped:(()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    //MARK: - Helper Functions
    private func setupUI(){
        
    }
    
    //MARK: - IBActions
    @IBAction func logoutButtonWasPressed(_ sender: Any) {
        logoutButtonTapped?()
    }
    
    @IBAction func deleteMyAccountButtonWasPressed(_ sender: Any) {
        deleteMyAccountButtonTapped?()
    }
    
}

