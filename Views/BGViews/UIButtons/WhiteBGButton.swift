//
//  WhiteBGButton.swift
//  MYBT
//
//  Created by Hafiz Anser on 24/02/2021.
//

import UIKit

class WhiteBGButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = Colors.WHITE_COLOR
        roundedUIView(withRadius: 8.0)
        setTitleColor(Colors.BUTTON_APP_TITLE_COLOR, for: .normal)
        //titleLabel?.font = Fonts.MY_RIAD_REGULAR_19
    }
}

class BaseBGButton: UIButton {
    
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
        roundedUIView(withRadius: 8.0)
        setTitleColor(Colors.WHITE_COLOR, for: .normal)
        //titleLabel?.font = Fonts.MY_RIAD_REGULAR_19
    }
}
