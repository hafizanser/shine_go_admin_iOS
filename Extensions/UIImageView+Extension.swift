//
//  UIImageView+Extension.swift
//  MYBT
//
//  Created by Hafiz Anser on 16/02/2021.
//

import UIKit
import Photos
import SDWebImage

extension UIImageView {
    
    func fetchImageAsset(_ asset: PHAsset?, size:CGSize, completionHandler: ((Bool) -> Void)?) {
        
        guard let asset = asset else {
            completionHandler?(false)
            return
        }
        
        let options = PHImageRequestOptions()
        options.isSynchronous = false
        
        PHImageManager.default().requestImage(for: asset, targetSize: size, contentMode: .aspectFill, options: nil) { [weak self] (image, info) -> Void in
            self?.image = image
            self?.contentMode = .scaleAspectFill
            self?.clipsToBounds = true
            completionHandler?(true)
        }

    }
    
    func applyshadowWithCorner(containerView : UIView, cornerRadious : CGFloat){
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowOffset = CGSize(width: 1, height: 2)
        containerView.layer.shadowRadius = 2
        containerView.layer.cornerRadius = cornerRadious
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: cornerRadious).cgPath
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadious
    }
    
    public func sd_setImageWithURLWithFade(url: URL!, placeholderImage placeholder: UIImage!)
    {
        self.sd_setImage(with: url, placeholderImage: placeholder,options: SDWebImageOptions(rawValue: 0)) { (image, error, cacheType, url) -> Void in
            
            if let downLoadedImage = image
            {
                if cacheType == .none
                {
                    self.alpha = 0
                    UIView.transition(with: self, duration: 0.4, options: UIView.AnimationOptions.transitionCrossDissolve, animations: { () -> Void in
                        self.image = downLoadedImage
                        self.alpha = 1
                    }, completion: nil)
                }
            }
            else
            {
                self.image = placeholder
            }
        }
    }
    
}


