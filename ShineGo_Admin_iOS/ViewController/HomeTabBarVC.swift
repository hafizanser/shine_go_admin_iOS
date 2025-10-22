//
//  HomeTabBarVC.swift
//  WatchGANG
//
//  Created by Hafiz Anser on 04/08/2022.
//
import UIKit
import LocalAuthentication

class CustomTabBar : UITabBar {
    @IBInspectable var height: CGFloat = 0.0
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        if height > 0.0 {
            sizeThatFits.height = height
        }
        return sizeThatFits
    }
}

class HomeTabBarVC: UITabBarController, UITabBarControllerDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    
    //MARK: -Comment
    
    private func configureTabBar() {
        self.delegate = self
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = true
        self.tabBar.tintColor = Colors.BASE_COLOR_DARK_BLUE
        self.tabBar.unselectedItemTintColor = Colors.BASE_COLOR_GRAY
    }
    

    

    
    
}
