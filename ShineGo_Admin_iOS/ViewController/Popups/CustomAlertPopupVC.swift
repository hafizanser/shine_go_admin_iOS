//
//  CustomAlertPopupVC.swift
//  MYBT
//
//  Created by Can on 16/02/2021.
//

import UIKit


class CustomAlertPopupVC: UIViewController {
    
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet var horizontalSeperatorView: UIView!
    @IBOutlet var verticalSepratorView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoDetailLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    
    @IBOutlet weak var cancelButton: UIButton!
    var titleString:String = ""
    var message:String?
    var attributedMessage = NSAttributedString.init(string: "")
    var cancelButtonTitle:String = "Cancel"
    var okButtonTitle:String = "OK"
    var hideCancelButton:Bool = true
    var okAction:(() -> Void)?
    var cancelAction:(() -> Void)?
    var isSwitchColors = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleString
        if let message = message {
            infoDetailLabel.text = message
        }else{
            infoDetailLabel.attributedText = attributedMessage
        }
        if isSwitchColors {
            okButton.setTitleColor(Colors.RED_COLOR, for: .normal)
            cancelButton.setTitleColor(Colors.BLACK_COLOR, for: .normal)
        }else{
            okButton.setTitleColor(Colors.BLACK_COLOR, for: .normal)
            cancelButton.setTitleColor(Colors.RED_COLOR, for: .normal)
        }
        okButton.setTitle(okButtonTitle, for: .normal)
        cancelButton.setTitle(cancelButtonTitle, for: .normal)
        cancelButton.isHidden = hideCancelButton
        verticalSepratorView.isHidden = hideCancelButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        horizontalSeperatorView.backgroundColor = Colors.GRAY_COLOR
        verticalSepratorView.backgroundColor = Colors.GRAY_COLOR
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.bgView.backgroundColor = Colors.BLACK_COLOR.withAlphaComponent(0.6)
        }, completion: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
            self.bgView.backgroundColor = Colors.BLACK_COLOR.withAlphaComponent(0.0)
        }, completion: nil)
    }
    
    @IBAction func okButtonWasPressed(_ sender: UIButton) {
        dismiss(animated: true) {
            self.okAction?()
        }
    }
    
    @IBAction func cancelButtonWasPressed(_ sender: UIButton) {
        dismiss(animated: true) {
            self.cancelAction?()
        }
    }
}
