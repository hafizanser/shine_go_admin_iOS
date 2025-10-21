//
//  UITableView+Extension.swift
//  MYBT
//
//  Created by Hafiz Anser on 07/05/2021.
//

import UIKit

extension UITableView {
    func removeSelection() -> Void {
        if let indexs = self.indexPathsForSelectedRows{
            indexs.forEach({ (indexPath) in
                self.deselectRow(at: indexPath, animated: true)
            })
        }
    }
}
