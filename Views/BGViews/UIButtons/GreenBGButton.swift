//
//  GreenBGButton.swift
//  MYBT
//
//  Created by Hafiz Anser on 15/02/2021.
//

import UIKit

class GreenBGButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = Colors.GREEN_COLOR
        roundedUIView(withRadius: frame.height/2)
        setTitleColor(Colors.WHITE_COLOR, for: .normal)
        titleLabel?.font = Fonts.MY_RIAD_REGULAR_19
    }
}
