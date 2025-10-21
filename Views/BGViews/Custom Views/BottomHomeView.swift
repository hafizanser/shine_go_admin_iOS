//
//  BottomHomeView.swift
//  MYBT
//
//  Created by Hafiz Anser on 18/02/2021.
//

import UIKit

class BottomHomeView: UIView {

    var view: UIView!
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.className, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    @IBAction func homeButtonWasPressed(_ sender: UIButton) {
        if let topVC = UIApplication.shared.visibleViewController {
            //Router.shared.openWarrningPopupVC(viewDelegate: self, isViewDelegate: true, controller: topVC)
        }
    }
    
    
    //MARK:- WarrningPopupVCDelegate
    func doneButtonPressed() {
        //ModeSelection.instance.homeMode()
    }

}
