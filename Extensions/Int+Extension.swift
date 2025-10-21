//
//  Int+Extension.swift
//  MYBT
//
//  Created by Hafiz Anser on 25/02/2021.
//

import Foundation

extension Int {
  var asWord: String? {
    let numberValue = NSNumber(value: self)
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    return formatter.string(from: numberValue)
  }
}
