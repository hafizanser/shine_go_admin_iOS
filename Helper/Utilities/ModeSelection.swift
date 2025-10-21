//
//  ModeSelection.swift
//  MYBT
//
//  Created by Hafiz Anser on 15/02/2021.
//

import Foundation
import UIKit

class ModeSelection {
    static let instance = ModeSelection()


    
    func homeMode() -> Void {
        if #available(iOS 13.0, *) {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                if let delegate = windowScene.delegate as? SceneDelegate {
                    if let window = delegate.window {
                        let rootVC = Storyboards.MAIN.instantiateViewController(withIdentifier: HomeTabBarVC.className) as! HomeTabBarVC
                        window.rootViewController = rootVC
                        window.makeKeyAndVisible()
                    }
                }
            }
        }
    }
    
    func AuthMode() -> Void {
        if #available(iOS 13.0, *) {
            print(UIApplication.shared.connectedScenes.count)
            print(UIApplication.shared.connectedScenes)
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                if let delegate = windowScene.delegate as? SceneDelegate {
                    if let window = delegate.window {
                        let rootVC = Storyboards.AUTH.instantiateViewController(withIdentifier: "AuthNavigationController")
                        window.rootViewController = rootVC
                        window.makeKeyAndVisible()
                    }
                }
            }
        }
    }

}

