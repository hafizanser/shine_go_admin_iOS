//
//  NSObject+Extension.swift
//  MYBT
//
//  Created by  on 15/02/2021.
//

import Foundation

extension NSObject {

    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
