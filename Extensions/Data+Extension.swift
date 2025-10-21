//
//  Data+Extension.swift
//  MYBT
//
//  Created by Hafiz Anser on 15/03/2021.
//

import Foundation
import CoreData

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
    
}


extension Date {
    func getEventDisplayDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.mm_dd_yyyy
        let dateStr = dateFormatter.string(from: self)
        return dateStr
    }
    
    func getChildDOB() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.yyyy_MM_dd
        let dateStr = dateFormatter.string(from: self)
        return dateStr
    }
    
    func getStringFromDate() -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.DATE_TIME_FORMAT
        return dateFormatter.string(from: self)
        
    }
    
    func getZeroTimeOnlyDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.DATE_TIME_FORMAT
        let str = dateFormatter.string(from: self)
        
        let validStr = str.getValidDateStr(str: str)
        return validStr
    }
    
    func convertTimeToUTC() -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = DateFormats.EN_US_POSIX
        dateFormatter.dateFormat = DateFormats.DATE_TIME_FORMAT
        dateFormatter.timeZone = DateFormats.UTC_TIME_ZONE
        return dateFormatter.string(from: self)
    }
    
    func getDisplayDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.MMMddyyyy
        
        let dateStr = dateFormatter.string(from: self)
        return dateStr
    }
    
    func getDisplaySpecificDateFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.yyyy_MM_dd
        
        let dateStr = dateFormatter.string(from: self)
        return dateStr
    }
    func getMonth() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.MONTH_FORMAT
        return dateFormatter.string(from: self)
    }
    
    func getYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.YEAR_FORMAT
        return dateFormatter.string(from: self)
    }
}

