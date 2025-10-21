//
//  CellCardBackgroundShadowedView.swift
//  Sense2Cents
//
//  Created by Hafiz Anser on 29/05/2021.
//

import UIKit

class CellCardBackgroundShadowedView: UIView {
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() -> Void {
        
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 2)
    }
}
