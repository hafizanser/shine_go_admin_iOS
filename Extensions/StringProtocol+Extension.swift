//
//  StringProtocol+Extension.swift
//  MYBT
//
//  Created by Hafiz Anser on 10/03/2021.
//

import Foundation

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
