//
//  UITextfield+Extension.swift
//  YadiProject
//
//  Created by Furqan baig on 07/01/2022.
//

import UIKit

extension UITextField {
    func placeholderColor(_ color: UIColor){
        var placeholderText = ""
        if self.placeholder != nil{
            placeholderText = self.placeholder!
        }
        self.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor : color])
    }
    
    func addBottomBorder() {
        
        let bottomLine = UIView(frame: .zero)
        bottomLine.backgroundColor = Colors.GRAY_COLOR
        
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bottomLine)
        NSLayoutConstraint.activate([
            bottomLine.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1),
            bottomLine.heightAnchor.constraint(equalToConstant: 1),
            bottomLine.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            bottomLine.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            bottomLine.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            ])
    }
}

