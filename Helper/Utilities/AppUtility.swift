//
//  AppUtility.swift
//  Transition

import Foundation
import UIKit
//import SVProgressHUD
import SDWebImage

class AppUtility: NSObject
{
    override init() {
        super.init();
    }
    
    static let shared = AppUtility();
 
    
    class func isValidEmail(testStr:String) -> Bool
    {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    class func isValidEmailStrict(_ email: String) -> Bool {
        let emailRegEx = "^(?!.*\\.\\.)(?!.*\\.$)[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return predicate.evaluate(with: email)
    }
    
    class func isValidOTP(_ string: String) -> Bool
    {
        let otpRegex = "^[0-9]{6}$"
        let otpTest = NSPredicate(format: "SELF MATCHES %@", otpRegex)
        return otpTest.evaluate(with: string)
    }
    
    class func isValidPassword(testStr: String) -> Bool {
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let numberRegEx  = ".*[0-9]+.*"
        let specialCharacterRegEx  = ".*[!&^%$#@()/]+.*"
        
        let capitalLetterTest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        let numberTest = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let specialCharacterTest = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx)
        
        return capitalLetterTest.evaluate(with: testStr) && numberTest.evaluate(with: testStr) && specialCharacterTest.evaluate(with: testStr)
    }

    
    class func convertDateToStringMMM(date :String) ->String
    {
        let datefrmter = DateFormatter()
        datefrmter.dateFormat = "MM/dd/yyyy"
        
        if let myString = datefrmter.date(from: date){
            datefrmter.dateFormat = "MMMM d, yyyy"
            let updatedString = datefrmter.string(from: myString)
            return updatedString
        }else{
            return "No Date"
        }
    }



//    class func saveUserSession(u :User)
//    {
//        let data = NSKeyedArchiver.archivedData(withRootObject:u as Any)
//        UserDefaults.standard.set(data, forKey: USER_LOGIN)
//        UserDefaults.standard.synchronize()
//    }
//
//    class func getSession() ->User
//    {
//        let data = UserDefaults.standard.data(forKey:USER_LOGIN)
//        let decodedObj = NSKeyedUnarchiver.unarchiveObject(with: data!) as? User
//        return decodedObj!
//    }
    

//    class func setImage(url:String, image:UIImageView)
//    {
//        image.sd_setImage(with: URL(string: url), placeholderImage: Icons.BLOG_PLACEHOLDER)
//    }
//    class func setImage(url: String, imageView: UIImageView)->Swift.Void
//    {
//        let placeHolder = UIImage(named: "placeholder")
//        imageView.image = placeHolder
//        let encodedString:String = url.replacingOccurrences(of: " ", with: "%20")
//        imageView.sd_setImage(with: URL(string: encodedString), placeholderImage: placeHolder)
//        imageView.sd_setImage(with: URL(string: encodedString), placeholderImage: placeHolder,options: SDWebImageOptions(rawValue: 0), completed: { image, error, cacheType, imageURL in
//            if error == nil
//            {
//                imageView.image = image
//            }
//        })
//    }
//
//    class func showErrorMessage(message:String)
//    {
//        let error = MessageView.viewFromNib(layout: .tabView)
//        error.configureTheme(.error)
//        error.configureContent(title: "Error", body: message)
//        error.button?.isHidden = true
//        SwiftMessages.show(view: error)
//    }
//
//    class func showSuccessMessage(message:String)
//    {
//        let success = MessageView.viewFromNib(layout: .tabView)
//        success.configureTheme(.success)
//        success.configureContent(title: "Success", body: message)
//        success.button?.isHidden = true
//        SwiftMessages.show(view: success)
//    }
//
    class func convertDateToStringSample(date :String) ->String
    {
        let dateString = "2022-06-30 14:30:00"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: dateString) {
            print(date) // prints: 2022-06-30 14:30:00 +0000
        } else {
            print("Invalid date format")
        }
        return ""
    }
    
    class func convertDateToString(date :NSDate) ->String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd h:mm a"
        let myString = formatter.string(from: date as Date)
        let yourDate: Date? = formatter.date(from: myString)
        formatter.dateFormat = "MM / yy"
        let updatedString = formatter.string(from: yourDate!)
        
        return updatedString
    }

    class func convertDateToStringForMKT(date :NSDate) ->String
    {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        //formatter.dateFormat = "yyyy-MM-dd h:mm a"
        //formatter.dateFormat = "h:mm a 'on' MMMM dd, yyyy"
        //yyyy-MM-dd
        formatter.dateFormat = "h:mm a 'on' yyyy-MM-dd"
        
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        let myString = formatter.string(from: date as Date)
        let yourDate: Date? = formatter.date(from: myString)
        //formatter.dateFormat = "dd.MM.yyyy h:mm a"
        //yyyy-MM-dd
        formatter.dateFormat = "yyyy-MM-dd h:mm a"
        
        let updatedString = formatter.string(from: yourDate!)
        
        return updatedString
    }
    
    class func stringToDate(_ str: String)->Date
    {
        let datefrmter = DateFormatter()
        datefrmter.dateFormat = "yyyy-MM-dd h:mm a"
        if let date = datefrmter.date(from: str)
        {
            return date
        }
        else
        {
            return Date()
        }
    }
//    class func showProgress()
//    {
//        SVProgressHUD.setDefaultStyle(.custom)
//        SVProgressHUD.setDefaultMaskType(.gradient)
//        SVProgressHUD.setForegroundColor(UIColor.darkGray)
//        SVProgressHUD.setBackgroundColor(UIColor.white)
//        SVProgressHUD.show()
//        //SVProgressHUD.show(withStatus: "Loading")
//    }
//    
//    class func hideProgress()
//    {
//        SVProgressHUD.dismiss()
//    }
//    func SVProgressHUDCustom()
//    {
//        SVProgressHUD.setDefaultStyle(.custom)
//        SVProgressHUD.setDefaultMaskType(.custom)
//        SVProgressHUD.setForegroundColor(UIColor.red)           //Ring Color
//        SVProgressHUD.setBackgroundColor(UIColor.yellow)        //HUD Color
//        SVProgressHUD.setBackgroundLayerColor(UIColor.green)
//    }
    
    class func setImage(_ card : String) -> UIImage? {
        switch card {
            
        case "Visa":
            let Visa = UIImage(named: "ic_visa")
            return Visa
        case "MasterCard":
            let Mastercard = UIImage(named: "ic_master")
            return Mastercard
        case "Amex":
            let Amex = UIImage(named: "ic_american_express")
            return Amex
        case "JCB":
            let JCB = UIImage(named: "ic_jcb")
            return JCB
        case "Discover":
            let discover = UIImage(named: "ic_discover")
            return discover
        case "Diners":
            let diners = UIImage(named: "ic_diners")
            return diners
        case "UnionPay":
            let union = UIImage(named: "ic_union")
            return union
        case "Unknown":
            let unknown = UIImage(named: "card_unknown")
            return unknown
        default:
            let unknown = UIImage(named: "card_unknown")
            return unknown
        }
    }
    
}
