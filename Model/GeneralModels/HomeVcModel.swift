//
//  HomeVcModel.swift
//  Phlex
//
//  Created by Hafiz Anser  on 8/9/24.
//

import Foundation
import UIKit
struct homeModel{
    var title:String?
    var subTitle:String?
    var image:UIImage?
    var isSelected:Bool?
    var price: String?
    var id: Int?
}
struct subscribeModel{
    var title:String?
    var price: String?
    var id: Int?
    var type: String?
}

struct IndividualModel {
    let isLast: Bool?
    var isHeading: Bool?
    var isPurchased: Bool?
}
