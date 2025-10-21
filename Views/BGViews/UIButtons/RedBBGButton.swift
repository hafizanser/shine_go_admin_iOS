//
//  RedBBGButton.swift
//  NewFire
//
//  Created by   on 7/9/21.
//

import UIKit

class RedBBGButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = Colors.BUTTON_APP_THEME_COLOR
        roundedUIView(withRadius: 10)
        setTitleColor(Colors.WHITE_COLOR, for: .normal)
        //titleLabel?.font = Fonts.MY_RIAD_REGULAR_19
    }

}
