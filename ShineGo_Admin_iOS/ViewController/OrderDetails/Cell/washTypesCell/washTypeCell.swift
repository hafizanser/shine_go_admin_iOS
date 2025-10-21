//
//  washTypeCell.swift
//  ShineGo
//
//  Created by Ahmad Malik on 10/17/25.
//

import UIKit

class washTypeCell: UITableViewCell {

    @IBOutlet weak var btnLocation: UIButton!
    @IBOutlet weak var lblCreatedDateAndTime: UILabel!
    @IBOutlet weak var lblBokkingDateAndTime: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblCard: UILabel!
    @IBOutlet weak var lblCarName: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblGoldShine: UILabel!
    @IBOutlet weak var imgMain: UIImageView!
    
    var locationButtonTapped:(()->())?
    var callButtonTapped:(()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
         setupUI()
    }

    //MARK: - Helper Functions
    private func setupUI(){
        
    }
    
    //MARK: - IBActions
    @IBAction func locationButtonWasPressed(_ sender: Any) {
        locationButtonTapped?()
    }
    
    @IBAction func callButtonWasPressed(_ sender: Any) {
        callButtonTapped?()
    }
}
