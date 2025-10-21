//
//  SelectedTargetRoundedBGView.swift
//  MYBT
//
//  Created by  on 17/02/2021.
//

import UIKit

class SelectedTargetRoundedBGView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() -> Void {
        
        roundedUIView(withRadius: 6.0)
        disable()
    }
    
    func enable() {
        addBorder(withBorderColor: .clear, borderWidth: 0.0)
        backgroundColor = Colors.DARK_YELLOW_COLOR
    }
    
    func disable() {
        addBorder(withBorderColor: Colors.GRAY_COLOR, borderWidth: 0.6)
        backgroundColor = .clear
    }
    
}
