//
//  UIViewController+Extension.swift
//  MYBT
//
//  Created by Hafiz Anser on 15/02/2021.
//

import UIKit
import AVFoundation
import MobileCoreServices
import AVKit
import MBProgressHUD

extension UIViewController {
    
    var topMostViewController: UIViewController {
        switch self {
        case is UINavigationController:
            return (self as! UINavigationController).visibleViewController?.topMostViewController ?? self
        case is UITabBarController:
            return (self as! UITabBarController).selectedViewController?.topMostViewController ?? self
        default:
            return presentedViewController?.topMostViewController ?? self
        }
    }
    
    var hasTopNotch: Bool {
        if #available(iOS 13.0,  *) {
            return UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.top ?? 0 > 20
        } else {
         return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
        }
    }

    func showToast(message : String, font: UIFont = .systemFont(ofSize: 12.0)) {
//        let toastLabel = UILabel(frame: CGRect(x: 10, y: self.view.frame.size.height-120, width: self.view.frame.width - 20, height: 35))
        let fontAttributes = [NSAttributedString.Key.font: font]
        let myText = message
        let size = (myText as NSString).size(withAttributes: fontAttributes)
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.center.x - (size.width/2), y: self.view.frame.height - 40, width: size.width + 50, height: size.height + 20))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 1, delay: 2.0, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    func addBackButtonOnly(){
        let button: UIButton = UIButton (type: UIButton.ButtonType.custom)
        
        button.leftImage(image: Icons.back_icon, renderMode: UIImage.RenderingMode.alwaysTemplate)
        button.frame = CGRect(x: 0, y: 0, width: 25, height: 40)
        button.tintColor = Colors.BLACK_COLOR
        
        button.contentMode = .left
        button.addTarget(self, action: #selector(backButtonPressed(btn:)), for: UIControl.Event.touchUpInside)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: button.imageView!.image!.size.width / 2)
        button.contentHorizontalAlignment = .left
        button.imageView?.contentMode = .scaleAspectFit
        
        let barButton = UIBarButtonItem(customView: button)
        if let navcontroller = self.navigationController{
            navcontroller.navigationItem.leftBarButtonItem = barButton
        }else{
            self.navigationItem.leftBarButtonItem = barButton
        }
    }
    
    var isModal: Bool {
        
        let presentingIsModal = presentingViewController != nil
        let presentingIsNavigation = navigationController?.presentingViewController?.presentedViewController == navigationController
        let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController
        
        return presentingIsModal || presentingIsNavigation || presentingIsTabBar
    }
    
    @objc func backButtonPressed(btn:UIButton) {
        if let navController = navigationController {
            if navController.viewControllers.count > 1 {
                self.navigationController?.popViewController(animated: true)
            } else if isModal {
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func openCameraWithPermision(isVideo: Bool = false, delegateController:UIViewController) -> Void {
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)){
            
            let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
            switch (authStatus){
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    if granted {
                        DispatchQueue.main.async {
                            let imagePicker = UIImagePickerController()
                            imagePicker.delegate = delegateController.self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
                            imagePicker.allowsEditing = true
                            imagePicker.videoMaximumDuration = TimeInterval(60.0)
                            imagePicker.sourceType = UIImagePickerController.SourceType.camera
                            if isVideo {
                                imagePicker.mediaTypes = [kUTTypeMovie as String,kUTTypeVideo as String,kUTTypeAVIMovie as String,kUTTypeMPEG as String,kUTTypeMPEG4 as String]
                            } else {
                                imagePicker.mediaTypes = [kUTTypeImage as String]
                            }
                            imagePicker.modalPresentationStyle = .overFullScreen
                            delegateController.present(imagePicker, animated: true, completion: nil)
                        }
                    }
                }
            case .restricted:
                confirmationMessage(title: "Unable to access the Camera", message: Alerts.CAMERA_PRIVACY_SETTINGS_TEXT, buttonYesTitle: K.SETTINGS_TEXT, buttonCancelTitle: K.CANCEL_TEXT, actionYes: {
                    
                    if let url = URL(string:UIApplication.openSettingsURLString) {
                        if UIApplication.shared.canOpenURL(url) {
                            if #available(iOS 10.0, *) {
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            } else {
                                UIApplication.shared.open(url)
                            }
                        }
                    }
                }) {
                }
            case .denied:
                confirmationMessage(title: "Unable to access the Camera", message: Alerts.CAMERA_PRIVACY_SETTINGS_TEXT, buttonYesTitle: K.SETTINGS_TEXT, buttonCancelTitle: K.CANCEL_TEXT, actionYes: {
                    
                    if let url = URL(string:UIApplication.openSettingsURLString) {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url)
                        }
                    }
                }) {
                }
            case .authorized:
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = delegateController.self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
//                imagePicker.allowsEditing = true
                imagePicker.videoMaximumDuration = TimeInterval(60.0)
                imagePicker.sourceType = UIImagePickerController.SourceType.camera
                if isVideo {
                    imagePicker.mediaTypes = [kUTTypeMovie as String,kUTTypeVideo as String,kUTTypeAVIMovie as String,kUTTypeMPEG as String,kUTTypeMPEG4 as String]
                } else {
                    imagePicker.mediaTypes = [kUTTypeImage as String]
                }
                imagePicker.modalPresentationStyle = .overFullScreen
                delegateController.present(imagePicker, animated: true, completion: nil)
            }
        }else{
            alertMessage(title: K.ALERT, alertMessage: Alerts.CAMERA_NOT_SUPPORTED_TEXT, action: {})
        }
    }
    
    func openSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func showProgressHud(title:String = K.LOADING_KEY) -> Void {
        let progressHud = MBProgressHUD.showAdded(to: view, animated: true)
        progressHud.label.text = title
    }
    
    func hideProgressHud() -> Void {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
    func alertNative(title: String, alertMessage:String, buttonTitle: String = "OK", action: (() -> Void)?) {
        let controller = UIAlertController(title: title, message: alertMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: buttonTitle, style: .default) { (act) in
            action?()
        }
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
    }
    
    func alertMessage(title: String, alertMessage:String, isSubscribed: Int? = nil, action: (() -> Void)?)
    {
        if alertMessage.lowercased().contains("cancelled") || alertMessage.lowercased().contains("caused connection abort") || alertMessage.contains("The Internet connection appears to be offline."){
            return
        }
        
        DispatchQueue.main.async {
            self.confirmationMessage(title: title, message: alertMessage, buttonYesTitle: "Ok", buttonCancelTitle: "", hideCancelButton: true, actionYes: {
                action?()
                if let isSubscription = isSubscribed {
                    if isSubscription == 0 {
                       // Router.shared.openSubscripttionPlanVC(controller: self, isComingFromSettings: false)
                    }
                }
            }, actionCancel: {})
        }
    }
    func alertWithTwoOptions(title: String, alertMessage:String, firstButtonTitle: String = "OK", cancelButtonTitle:String = "Cancel", okAction: (() -> Void)?, cancelAction: (() -> Void)?) {
        let controller = UIAlertController(title: title, message: alertMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: firstButtonTitle, style: .default) { (act) in
            okAction?()
        }
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel) { (act) in
            cancelAction?()
        }
        controller.addAction(okAction)
        controller.addAction(cancelAction)
        present(controller, animated: true, completion: nil)
    }
    
    func alertMessage(title: String, alertMessage:String, action: (() -> Void)?)
    {
        if alertMessage.lowercased().contains("cancelled") || alertMessage.lowercased().contains("caused connection abort") || alertMessage.contains("The Internet connection appears to be offline."){
            return
        }
        
        DispatchQueue.main.async {
//            self.hideProgressHud()
            self.confirmationMessage(title: title, message: alertMessage, buttonYesTitle: "OK", buttonCancelTitle: "", hideCancelButton: true, actionYes: {
                action?()
            }, actionCancel: {})
//            let myAlert = UIAlertController(title:title, message:alertMessage, preferredStyle: UIAlertController.Style.alert)
//            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {
//                UIAlertAction in
//                action?()
//            }
//            myAlert.addAction(okAction);
//            self.present(myAlert, animated:true, completion:nil)
        }
    }
    
    func showToastLable(message: String, font: UIFont = .systemFont(ofSize: 12.0), delay: Double) {
        let toastLabel = UILabel()
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(1.0)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.numberOfLines = 0  // Allow multiple lines
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true

        let maxSize = CGSize(width: self.view.frame.width - 40, height: self.view.frame.height)
        let expectedSize = toastLabel.sizeThatFits(maxSize)

        // Set frame based on calculated size
        toastLabel.frame = CGRect(
            x: (self.view.frame.width - expectedSize.width - 20) / 2,
            y: self.view.frame.height - expectedSize.height - 80,
            width: expectedSize.width + 20,
            height: expectedSize.height + 20
        )

        self.view.addSubview(toastLabel)

        UIView.animate(withDuration: 1, delay: delay, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }) { _ in
            toastLabel.removeFromSuperview()
        }
    }
    
    func confirmationMessage(title: String, message: String?,attributedMessage:NSAttributedString = NSAttributedString(string: ""), buttonYesTitle: String, buttonCancelTitle: String, hideCancelButton:Bool = false, actionYes: @escaping (() -> Void), actionCancel: @escaping (() -> Void)) {
        
        let control = Storyboards.POPUPS.instantiateViewController(withIdentifier: CustomAlertPopupVC.className) as! CustomAlertPopupVC
        control.titleString = title
        control.message = message
        control.attributedMessage = attributedMessage
        control.okButtonTitle = buttonYesTitle
        control.cancelButtonTitle = buttonCancelTitle
        control.hideCancelButton = hideCancelButton
        control.okAction = {
            actionYes()
        }
        
        control.cancelAction = {
            actionCancel()
        }
        control.modalPresentationStyle = .overFullScreen
        self.present(control, animated: false, completion: nil)
        
    }
    
    
    func openVideoController(urlStr: String) {
        if let videoURL = URL(string: urlStr) {
            let player = AVPlayer(url: videoURL)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            self.present(playerViewController, animated: true) {
                playerViewController.player!.play()
            }
        }
    }
}

extension UINavigationController {
    func popViewControllerWithHandler(animated:Bool = true, completion: @escaping ()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popViewController(animated: animated)
        CATransaction.commit()
    }

    func pushViewController(viewController: UIViewController, animated:Bool = true,  completion: @escaping ()->()) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
