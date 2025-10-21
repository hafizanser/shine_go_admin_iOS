//
//  String+Extension.swift
//  MYBT
//
//  Created by Hafiz Anser on 17/03/2021.
//

//import Foundation
//
//extension String {
//    subscript (index: Int) -> Character {
//        let charIndex = self.index(self.startIndex, offsetBy: index)
//        return self[charIndex]
//    }
//
//    subscript (range: Range<Int>) -> Substring {
//        let startIndex = self.index(self.startIndex, offsetBy: range.startIndex)
//        let stopIndex = self.index(self.startIndex, offsetBy: range.startIndex + range.count)
//        return self[startIndex..<stopIndex]
//    }
//
//}

import Foundation
import UIKit

extension String {
    subscript (index: Int) -> Character {
        let charIndex = self.index(self.startIndex, offsetBy: index)
        return self[charIndex]
    }

    subscript (range: Range<Int>) -> Substring {
        let startIndex = self.index(self.startIndex, offsetBy: range.startIndex)
        let stopIndex = self.index(self.startIndex, offsetBy: range.startIndex + range.count)
        return self[startIndex..<stopIndex]
    }

    func getValidDateStr(str: String) -> String {
        var resultStr = ""
        if str.contains("T") {
            if var firstDateComponent = str.components(separatedBy: "T").first {
                if firstDateComponent.contains("-") {
                    resultStr = firstDateComponent + "T00:00:00"
                } else if firstDateComponent.contains("/") {
                    firstDateComponent = firstDateComponent.replacingOccurrences(of: "/", with: "-")
                    resultStr = firstDateComponent + "T00:00:00"
                }
            }
        } else {
            var temp = str
            temp = temp.replacingOccurrences(of: " ", with: "T")
            temp = temp.replacingOccurrences(of: "/", with: "-")
            resultStr = str + "T00:00:00"
        }
        
        return resultStr
    }
    
    func localized(_ args: CVarArg...) -> String {
        guard !isEmpty else { return self }
        let localizedString = NSLocalizedString(self, comment: "")
        if args.isEmpty {
            return localizedString
        } else {
            return withVaList(args) { NSString(format: localizedString, locale: Locale.current, arguments: $0) as String }
        }
    }
    
    func getLocalDate() -> Date{
        let startIndex = self.index(self.startIndex, offsetBy: 0)
        let endIndex = self.index(self.startIndex, offsetBy: 18)
        let substring = self[startIndex...endIndex]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.DATE_TIME_FORMAT
        
        let convertedlocalTime = String(substring).UTCToLocal()
        dateFormatter.locale = DateFormats.EN_US_POSIX
        let localDate = dateFormatter.date(from: convertedlocalTime)
        
        return localDate!
    }
    
    func UTCToLocal() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.DATE_TIME_FORMAT
        dateFormatter.timeZone = DateFormats.UTC_TIME_ZONE
        dateFormatter.locale = DateFormats.EN_US_POSIX
        let dt = dateFormatter.date(from: self)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = DateFormats.DATE_TIME_FORMAT
        let localDate = dateFormatter.string(from: dt ?? Date())
        return localDate
    }

    func withBoldText(text: String, font: UIFont? = nil) -> NSAttributedString {
        let _font = font ?? UIFont.systemFont(ofSize: 14, weight: .regular)
        let fullString = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.font: _font])
        let boldFontAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: _font.pointSize)]
        let range = (self as NSString).range(of: text)
        fullString.addAttributes(boldFontAttribute, range: range)
        return fullString
    }
    
    func getImageURL() -> String {
        let urlStr = apiImageBaseUrl + "/uploads/" + self
        return urlStr
    }
    
    func getThumbnailURL() -> String {
        let urlStr = apiImageBaseUrl + "/uploads/thumbnails/" + self
        return urlStr
    }
    
    func getVideoURL() -> String {
        let urlStr = apiImageBaseUrl + "/uploads/" + self
        return urlStr
    }
}
extension String {
   var containsSpecialCharacter1: Bool {
       
       //Minimum 8 characters at least 1 Alphabet, 1 Number and 1 Special Character:
       let regex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
       
      // Minimum 8 characters at least 1 Alphabet and 1 Number:
       //let regex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
      let testString = NSPredicate(format:"SELF MATCHES %@", regex)
      return testString.evaluate(with: self)
   }
}
