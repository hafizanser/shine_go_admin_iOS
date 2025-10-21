//
//  PopupMainView.swift
//  MYBT
//
//  Created by Hafiz Anser on 16/02/2021.
//


import UIKit

class popUpMainView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() -> Void {
        
        backgroundColor = Colors.WHITE_COLOR
        layer.cornerRadius = 15
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.5
        
    }
}

class popUpBottomMainView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() -> Void {
        
        roundWithCorners(corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner], radius: 15)
        backgroundColor = Colors.WHITE_COLOR
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.5
        
    }
}

class BottomMainView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() -> Void {
        
        roundWithCorners(corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner], radius: 15)
        backgroundColor = Colors.WHITE_COLOR
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.2
        
    }
}

class BGRoundedView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() -> Void {
        
        roundedUIView(withRadius: 20.0)
        
    }
}


class PhotoRoundedView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() -> Void {
        
        roundedUIView(withRadius: 10.0)
        
    }
}
