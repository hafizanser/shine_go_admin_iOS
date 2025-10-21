//
//  Dictionary+Extension.swift
//  MYBT
//
//  Created by Hafiz Anser on 15/03/2021.
//

import Foundation

extension Dictionary where Key:ExpressibleByStringLiteral {
    
    func convertToJSONString() -> String{
        var paramStr:String!
        if let theJSONData = try? JSONSerialization.data(withJSONObject: self,options: []) {
            paramStr = String(data: theJSONData,
                              encoding: .utf8)!
        }
        return paramStr
    }
}
