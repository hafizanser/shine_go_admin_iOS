//
//  BookingsCell.swift
//  ShineGo
//
//  Created by Ahmad Malik on 10/16/25.
//

import UIKit

class BookingsCell: UITableViewCell {

    @IBOutlet weak var lblLocationTime: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var lblArriveTime: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var imgMain: UIImageView!
    
    var nextButtonTapped:(()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
         setupUI()
    }

    //MARK: - Helper Functions
    private func setupUI(){
        
    }
    
    //MARK: - IBActions
    
    @IBAction func nextButtonWasPressed(_ sender: Any) {
        nextButtonTapped?()
    }
}
