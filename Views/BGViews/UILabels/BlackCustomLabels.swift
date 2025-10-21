//
//  BlackCustomLabels.swift
//  MYBT
//
//  Created by Hafiz Anser on 16/02/2021.
//

import UIKit

class BlackLabel : UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() -> Void {
        
        textColor = Colors.BLACK_COLOR
//        font = Fonts.HELVETICA_REGULAR_14
        
    }
}
