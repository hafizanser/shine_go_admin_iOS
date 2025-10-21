//
//  Router.swift
//  MYBT
//
//  Created by  Hafiz Anser on 15/02/2021.
//

import Foundation
import UIKit
import Photos
import AVFoundation
import MobileCoreServices
import AVKit
import MBProgressHUD

class Router {
    
    static let shared = Router()
    var shouldOpenCreateProject = false
    
    //Auth
//    func openOTPVC(controller:UIViewController, email: String, OTP: String) -> Void {
//        let control = Storyboards.AUTH.instantiateViewController(withIdentifier: OTPVC.className) as! OTPVC
//        control.email = email
//        control.otpStr = OTP
//        controller.show(control, sender: nil)
//    }
    
    //MAIN
    
    func openorderDetailsVC(controller:UIViewController) -> Void {
        let control = Storyboards.MAIN.instantiateViewController(withIdentifier: orderDetailsVC.className) as! orderDetailsVC
        controller.show(control, sender: nil)
    }
    
    func openWebViewVC(controller:UIViewController, buttonTapped: Int) -> Void {
        let control = Storyboards.MAIN.instantiateViewController(withIdentifier: WebViewVC.className) as! WebViewVC
        control.buttonTapped = buttonTapped
        controller.show(control, sender: nil)
    }
    
    //POPUPS
    func openSetDateTimePopUPVC(title:String = "Month & Year",minumumDate:Date? = nil,maximumDate:Date? = nil,alreadySelectedDate:Date? = nil,isDateOnly:Bool = false ,controller:UIViewController,completionHandler:@escaping DateSelectionCompletionHandler) -> Void {
        let control = Storyboards.POPUPS.instantiateViewController(withIdentifier: SetDateTimePopUPVC.className) as! SetDateTimePopUPVC
        control.headingString = title
        control.alreadySelectedDate = alreadySelectedDate
        control.minumumDate = minumumDate
        control.maximumDate = maximumDate
        control.isDateOnly = isDateOnly
        control.doneButtonDidPressed = completionHandler
        controller.present(getNavigationController(controller: control), animated: true, completion: nil)
        
    }
    
//    func openOTPResendPopUpVC(controller:UIViewController) -> Void {
//        let control = Storyboards.POPUPS.instantiateViewController(withIdentifier: OTPResendPopUpVC.className) as! OTPResendPopUpVC
//        controller.present(getNavigationController(controller: control), animated: true, completion: nil)
//    }
    
    func openSetMonthYearPopUpVC(controller:UIViewController, monthStr: String, yearStr: String) -> Void {
        let control = Storyboards.POPUPS.instantiateViewController(withIdentifier: SetMonthYearPopupVC.className) as! SetMonthYearPopupVC
        control.monthStr = monthStr
        control.yearStr = yearStr
        control.delegate = controller.self as? SetMonthYearPopUPDelegate
        controller.present(getNavigationController(controller: control), animated: true, completion: nil)
    }
    
    func getNavigationController(controller:UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.navigationBar.isHidden = true
        navigationController.navigationBar.backgroundColor = UIColor.clear
        navigationController.modalPresentationStyle = .overFullScreen
        return navigationController
    }
    
    
    func openImagePickerCustomViewController(mediaType : PHAssetMediaType = .image, controller:UIViewController) -> Void {
        let control = Storyboards.POPUPS.instantiateViewController(withIdentifier: ImagePickerCustomViewController.className) as! ImagePickerCustomViewController
        control.delegate = controller.self as? ImagePickerCustomViewControllerDelegate
        control.mediaType = mediaType
        control.addBackButtonOnly()
        controller.show(control, sender: nil)
    }
    
    func openMenuOptionPopUpVC(options:[MenuOptions],isEnable:Bool = true,selectedOption:MenuOptions? = nil,controller:UIViewController,completionHandler:@escaping MenuOptionSelectionCompletionHandler) -> Void {
        let control = Storyboards.POPUPS.instantiateViewController(withIdentifier: MenuOptionPopUpVC.className) as! MenuOptionPopUpVC
        control.options = options
        control.selectedOption = selectedOption
        control.selectionHandler = completionHandler
        control.isEnable = isEnable
        controller.presentPanModal(control)
    }
}
