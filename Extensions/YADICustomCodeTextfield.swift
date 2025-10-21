//
//  YADICustomCodeTextfield.swift
//  YadiProject
//
//  Created by Furqan baig on 07/01/2022.
//

import UIKit

class YADICustomCodeTextfield: UITextField,UITextFieldDelegate  {
    private var leftImageView:UIImageView?
    private var rightButtonView:UIButton?
    
    var textChanged : ((String)->())?
    var deleteText : EmptyCompletionHandler?

    var rightButtonPressed : EmptyCompletionHandler?
    
    var isRightButtonPressed : Bool = false {
        didSet {
            rightButtonView?.tintColor = isRightButtonPressed ? #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1) : #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            isSecureTextEntry = !isRightButtonPressed
        }
    }
    
    var leftImage:UIImage? {
        didSet {
            if let image = leftImage {
                
                leftImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24.0, height: 24.0))
                leftImageView?.image = image
                leftImageView?.contentMode = .center
                leftImageView?.tintColor = text!.isEmpty ? #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1) : #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
                
                let view = UIView(frame: CGRect(x: 2, y: 0, width: 34, height: 40))
                view.addSubview(leftImageView!)
                leftViewMode = UITextField.ViewMode.always
                leftView = view
                leftImageView!.center = view.center
            } else {
                let view = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 40))
                leftViewMode = UITextField.ViewMode.always
                leftView = view
            }
        }
    }
    
    var rightImage:UIImage? {
        didSet {
            if let image = rightImage {
                
                rightButtonView = UIButton(frame: CGRect(x: 0, y: 0, width: 24.0, height: 24.0))
                rightButtonView?.setImage(image, for: UIControl.State.normal)
                rightButtonView?.tintColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
                
                let view = UIView(frame: CGRect(x: -6, y: 0, width: 38, height: 40))
                view.addSubview(rightButtonView!)
                rightViewMode = UITextField.ViewMode.always
                rightView = view
                rightButtonView?.center = view.center
                rightButtonView?.addTarget(self, action: #selector(rightButtonWasPressed), for: UIControl.Event.touchUpInside)
                
            } else {
                let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
                rightViewMode = UITextField.ViewMode.always
                rightView = view
                
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override func deleteBackward() {
        super.deleteBackward()
        deleteText?()
    }
    
    private func setupView() -> Void {
        //placeholderColor(GREY_COLOR)
        textColor = Colors.BLACK_COLOR
        placeholderColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        
        autocorrectionType = .yes
        borderStyle = .none
        layer.borderColor = UIColor.clear.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 6
        
        layer.shadowColor = Colors.GRAY_TEXT.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 6
        layer.shadowOffset = CGSize(width: 0, height: 0)
        
        font = Fonts.MONTSERRAT_REGULAR_20
        addTarget(self, action: #selector(self.textEditingChanged), for: UIControl.Event.editingChanged)
        leftImage = nil
        rightImage = nil
        delegate = self
    }
    
    private func beginTextEditing() -> Void {
        layer.borderColor = UIColor.clear.cgColor
        layer.shadowColor = Colors.GRAY_TEXT.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 6
       
        layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    private func endTextEditing() -> Void {
        layer.borderColor = UIColor.clear.cgColor
        layer.shadowColor = Colors.GRAY_TEXT.cgColor
        layer.shadowOpacity = 0.4
        
        layer.shadowRadius = 6
        layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    func setBorderColorForPincodeScren() -> Void {
           layer.borderColor = UIColor.clear.cgColor
           layer.shadowColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
           layer.shadowOpacity = 0.2
           layer.shadowRadius = 4
          
           layer.shadowOffset = CGSize(width: 0, height: 6)
       }
    
    @objc func rightButtonWasPressed() {
        rightButtonPressed?()
    }
    
    @objc func textEditingChanged() -> Void {
        if let imageView = leftImageView {
            imageView.tintColor = text!.isEmpty ? #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1) : Colors.WHITE_COLOR
        }
        textChanged?(text!)
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        beginTextEditing()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        endTextEditing()
    }
}
