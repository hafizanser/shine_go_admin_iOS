//
//  CustomTextfield.swift
//  MYBT
//
//  Created by Hafiz Anser on 15/02/2021.
//

import UIKit



class CustomTextfield: UITextField {
    
    private var leftImageView:UIImageView?
    private var rightButtonView:UIButton?
    
    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
//    var textChanged : ((String)->())?

    var rightButtonPressed : EmptyCompletionHandler?
    
    var isRightButtonPressed : Bool = false {
        didSet {
            rightButtonView?.tintColor = isRightButtonPressed ? Colors.WHITE_COLOR : Colors.WHITE_COLOR
            isSecureTextEntry = !isRightButtonPressed
        }
    }
    
    var leftImage:UIImage? {
        didSet {
            if let image = leftImage {
                
                leftImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20.0, height: 20.0))
                leftImageView?.image = image
                leftImageView?.contentMode = .center
                leftImageView?.tintColor = text!.isEmpty ? Colors.WHITE_COLOR  : Colors.WHITE_COLOR
                
                let view = UIView(frame: CGRect(x: 2, y: 0, width: 40, height: 40))
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
                rightButtonView?.tintColor = Colors.WHITE_COLOR
                
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
    
    private func setupView() -> Void {
        //placeholderColor(GREY_COLOR)
        textColor = Colors.BLACK_COLOR
//        placeholderColor(Colors.gr )
        
        autocorrectionType = .yes
        borderStyle = .none
        layer.borderColor = Colors.GRAY_COLOR.cgColor
        layer.borderWidth = 0.7
        layer.cornerRadius = 4
        roundedUIView(withRadius: frame.height/2)
//        font = Fonts.ALLER_REGULAR_14
//        addTarget(self, action: #selector(self.textEditingChanged), for: UIControl.Event.editingChanged)
        leftImage = nil
        rightImage = nil
//        delegate = self
        backgroundColor = Colors.WHITE_COLOR
        
//        if keyboardType == .emailAddress {
//            autocapitalizationType = .none
//        } else {
//            autocapitalizationType = .sentences
//        }
    }
    
    @objc func rightButtonWasPressed() {
        rightButtonPressed?()
    }
//
//    @objc func textEditingChanged() -> Void {
//        if let imageView = leftImageView {
//            imageView.tintColor = text!.isEmpty ? Colors.WHITE  : Colors.WHITE
//        }
//        textChanged?(text!)
//    }
//
//    //MARK: UITextFieldDelegate
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
    
    
}
