//
//  SetMonthYearPopupVC.swift
//  ShineGo
//
//  Created by Hafiz Anser  on 7/24/22.
//

import UIKit
import MonthYearPicker


protocol SetMonthYearPopUPDelegate: AnyObject {
    func doneBtnDidPressed(monthStr: String, yearStr: String)
}

class SetMonthYearPopupVC: UIViewController {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet var btnDOne: UIButton!
    
    var picker = MonthYearPickerView()
    var monthStr: String = ""
    var yearStr: String = ""
    var delegate: SetMonthYearPopUPDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.bgView.backgroundColor = Colors.BLACK_COLOR.withAlphaComponent(0.7)
            
        }, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.bgView.backgroundColor = Colors.BLACK_COLOR.withAlphaComponent(0.7)
            
        }, completion: nil)
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
            self.bgView.backgroundColor = Colors.BLACK_COLOR.withAlphaComponent(0.0)
        }, completion: nil)
    }
    
    func datePicker(){
        picker = MonthYearPickerView(frame: CGRect(origin: CGPoint(x: 0, y: (view.bounds.height - 216) / 2), size: CGSize(width: view.bounds.width, height: 216)))
        
        //        picker = MonthYearPickerView(frame: CGRect(origin: CGPoint(x: datePicker.frame.origin.x, y: datePicker.center.y+100), size: CGSize(width: datePicker.frame.size.width - 50, height: datePicker.frame.size.height)))
        
        picker.minimumDate = Date()
        picker.maximumDate = Calendar.current.date(byAdding: .year, value: 10, to: Date())
        
        monthStr = "\(picker.date.getMonth())"
        yearStr = "\(picker.date.getYear())"
        
        picker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        
        view.addSubview(picker)
    }
    
    @objc private func dateChanged(_ sender: UIButton) {
        monthStr = "\(picker.date.getMonth())"
        yearStr = "\(picker.date.getYear())"
    }
    
    //MARK: - IBAction
    @IBAction func doneButtonWasPressed(_ sender: Any) {
        self.dismiss(animated: true) {
            self.delegate?.doneBtnDidPressed(monthStr: self.monthStr, yearStr: self.yearStr)
        }
    }
    
    
}
