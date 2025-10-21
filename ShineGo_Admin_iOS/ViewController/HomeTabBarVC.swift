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
    
    private var lockView: UIView?
    private var isLockScreenPresented = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
        //        addObservers()
    }
    
    
    //MARK: -Comment
    //Uncomment this viewDidAppear for FaceID
    
    
    //    override func viewDidAppear(_ animated: Bool) {
    //        super.viewDidAppear(animated)
    //
    //        // Show lock and prompt only when view is fully visible
    //        if !isLockScreenPresented {
    //            isLockScreenPresented = true
    //            showLockScreen()
    //            promptBiometricUnlock()
    //        }
    //    }
    
    private func configureTabBar() {
        self.delegate = self
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = true
        self.tabBar.tintColor = Colors.BASE_COLOR_PINK
        self.tabBar.unselectedItemTintColor = Colors.BASE_COLOR_GRAY
    }
    
    private func addObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(appWillEnterForeground),
            name: UIScene.willEnterForegroundNotification,
            object: nil
        )
    }
    
    @objc private func appWillEnterForeground() {
        guard !isLockScreenPresented else { return }
        isLockScreenPresented = true
        showLockScreen()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.promptBiometricUnlock()
        }
    }
    
    private func showLockScreen() {
        guard lockView == nil else { return }
        
        let lockView = UIView(frame: view.bounds)
        lockView.backgroundColor = .systemBackground
        lockView.tag = 9999
        
        // Lock Icon
        let icon = UIImageView(image: UIImage(systemName: "lock.fill"))
        icon.tintColor = .label
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        // Label
        let label = UILabel()
        label.text = "Unlock to Continue"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // Unlock Button
        let unlockButton = UIButton(type: .system)
        unlockButton.setTitle("Unlock", for: .normal)
        unlockButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        unlockButton.translatesAutoresizingMaskIntoConstraints = false
        unlockButton.addTarget(self, action: #selector(unlockButtonTapped), for: .touchUpInside)
        
        lockView.addSubview(icon)
        lockView.addSubview(label)
        lockView.addSubview(unlockButton)
        
        NSLayoutConstraint.activate([
            icon.centerXAnchor.constraint(equalTo: lockView.centerXAnchor),
            icon.centerYAnchor.constraint(equalTo: lockView.centerYAnchor, constant: -40),
            icon.widthAnchor.constraint(equalToConstant: 50),
            icon.heightAnchor.constraint(equalToConstant: 50),
            
            label.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: lockView.centerXAnchor),
            
            unlockButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            unlockButton.centerXAnchor.constraint(equalTo: lockView.centerXAnchor),
            unlockButton.widthAnchor.constraint(equalToConstant: 120),
            unlockButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        // Add nice rounded button style
        unlockButton.backgroundColor = .systemBlue
        unlockButton.setTitleColor(.white, for: .normal)
        unlockButton.layer.cornerRadius = 12
        
        view.addSubview(lockView)
        self.lockView = lockView
    }
    
    @objc private func unlockButtonTapped() {
        promptBiometricUnlock()
    }
    
    private func shakeUnlockButton() {
        guard let lockView = lockView,
              let button = lockView.subviews.first(where: { $0 is UIButton }) else { return }
        
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.duration = 0.4
        animation.values = [-10, 10, -8, 8, -5, 5, 0]
        button.layer.add(animation, forKey: "shake")
    }
    
    
    private func hideLockScreen() {
        guard let lockView = lockView else { return }
        
        UIView.animate(withDuration: 0.3, animations: {
            lockView.alpha = 0
        }) { _ in
            lockView.removeFromSuperview()
            self.lockView = nil
        }
    }
    
    private func promptBiometricUnlock() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "Unlock the app to continue") { success, _ in
                DispatchQueue.main.async {
                    if success {
                        self.unlockSucceeded()
                    } else {
                        self.shakeUnlockButton()
                        self.isLockScreenPresented = false
                    }
                }
            }
        } else {
            // No Face ID / Touch ID / Passcode configured, just unlock
            unlockSucceeded()
        }
    }
    
    private func unlockSucceeded() {
        isLockScreenPresented = false
        hideLockScreen()
    }
}
