//
//  UIDevice+Extension.swift
//  MYBT
//
//  Created by Hafiz Anser on 22/02/2021.
//

import UIKit
import AudioToolbox

extension UIDevice {
    static func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}
