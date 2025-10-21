//
//  UIView+Extension.swift
//  MYBT
//
//  Created by  on 15/02/2021.
//

import UIKit
import AVFoundation
import MobileCoreServices
import AVKit


extension UIView {
    func addBottomShadow() {
        layer.masksToBounds = false
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.4
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0 , height: 2)
        layer.shadowPath = UIBezierPath(rect: CGRect(x: 0,
                                                     y: bounds.maxY - layer.shadowRadius,
                                                     width: bounds.width,
                                                     height: layer.shadowRadius)).cgPath
    }
    func RoundShadow(){
        layer.shadowColor = UIColor(red: 19/255, green: 109/255, blue: 183/255, alpha: 0.1).cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 1.0
        layer.masksToBounds = false
    }
    
    func RoundWhiteShadow(){
        layer.shadowColor = Colors.GRAY_01.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 3)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 6.0
        layer.masksToBounds = false
        
    }
    
    func RemoveShadow(){
        layer.shadowColor = Colors.PURPLE_HEADER_SUDS.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 0.0
        layer.shadowRadius = 0.0
        layer.masksToBounds = false
        
    }
    
    func roundWithCorners(corners:CACornerMask, radius: CGFloat) {
        if #available(iOS 11.0, *) {
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = corners
        } else {
            print("not able to round specific corner")
        }
    }
    
    func simpleRound(){
        layer.cornerRadius = frame.height/2
        clipsToBounds = true
    }
    
    func roundedUIView(withRadius radius: CGFloat){
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    
    func roundedUIView(withRadius radius: CGFloat,withBorderColor color:UIColor,borderWidth:CGFloat = 1){
        layer.cornerRadius = radius
        clipsToBounds = true
        layer.borderColor = color.cgColor
        layer.borderWidth = borderWidth
    }
    
    func addBorder(withBorderColor color:UIColor,borderWidth:CGFloat = 1){
        layer.borderColor = color.cgColor
        layer.borderWidth = borderWidth
    }
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat)
    {
        if #available(iOS 11, *)
        {
            var cornerMask = CACornerMask()
            if(corners.contains(.topLeft)){
                cornerMask.insert(.layerMinXMinYCorner)
            }
            if(corners.contains(.topRight)){
                cornerMask.insert(.layerMaxXMinYCorner)
            }
            if(corners.contains(.bottomLeft)){
                cornerMask.insert(.layerMinXMaxYCorner)
            }
            if(corners.contains(.bottomRight)){
                cornerMask.insert(.layerMaxXMaxYCorner)
            }
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = cornerMask
            
        }
        else
        {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
    
    func roundCornersSpecific(_ corners: UIRectCorner, radius: CGFloat)
    {
        if #available(iOS 11, *)
        {
            var cornerMask = CACornerMask()
            if(corners.contains(.topLeft)){
                cornerMask.insert(.layerMinXMinYCorner)
            }
            if(corners.contains(.topRight)){
                cornerMask.insert(.layerMaxXMinYCorner)
            }
            if(corners.contains(.bottomLeft)){
                cornerMask.insert(.layerMinXMaxYCorner)
            }
            if(corners.contains(.bottomRight)){
                cornerMask.insert(.layerMaxXMaxYCorner)
            }
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = cornerMask
            
        }
        else
        {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
    
    func rotate(angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: radians);
        self.transform = rotation
    }
    func applyBlurEffect() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.6
        addSubview(blurEffectView)
    }
    
    @objc func hapticError() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
    
    @objc func hapticSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    @objc func hapticWarning() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
    }
    
    @objc func hapticImpactLight() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
    
    @objc func hapticImpactMedium() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    
    @objc func hapticImpactHeavy() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
    }
    
    @objc func hapticSelectionChanged() {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
    }
    
}

