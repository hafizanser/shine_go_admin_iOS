//
//  MenuOptionPopUpVC.swift
//  MYBT
//
//  Created by Can on 07/05/2021.
//

import UIKit

typealias MenuOptionSelectionCompletionHandler = ((MenuOptions)-> ())

protocol MenuOptions {
    func getRawValue() -> String
}

enum CameraMenuOptions:String,CaseIterable,MenuOptions {
    
    case camera = "Camera"
    case photolibrary = "Choose from library"
    case removePhoto = "Remove Photo"
    case cancel = "Cancel"
    
    func getRawValue() -> String {
        return self.rawValue
    }
}

enum UploadMenuOptions:String,CaseIterable,MenuOptions {
    
    case Photos = "Photos"
    case Videos = "Videos"
    case cancel = "Cancel"
    
    func getRawValue() -> String {
        return self.rawValue
    }
}

enum PhotosMenuOptions:String,CaseIterable,MenuOptions {
    
    case capturePhotos = "Capture Photo"
    case chooseGallery = "Choose Photo From Gallery"
    case cancel = "Cancel"
    
    func getRawValue() -> String {
        return self.rawValue
    }
}

enum VideoMenuOptions:String,CaseIterable,MenuOptions {
    
    case captureVideo = "Capture Video"
    case chooseGallery = "Choose Video From Gallery"
    case cancel = "Cancel"

    func getRawValue() -> String {
        return self.rawValue
    }
}

enum BlockUserMenuOptions:String,CaseIterable,MenuOptions {
    
    case Report = "Report"
    case Block = "Block"
    case cancel = "Cancel"

    func getRawValue() -> String {
        return self.rawValue
    }
}


enum ImageVideoMenuOptions:String,CaseIterable,MenuOptions {
    
    case image = "Choose image"
    case video = "Choose Video"
    case cancel = "Cancel"

    func getRawValue() -> String {
        return self.rawValue
    }
}

class PopUpOptionTableViewCell: UITableViewCell {
    
    @IBOutlet var optionTitleLabel: UILabel!
    
    func configureCell(option:MenuOptions, isEnable:Bool) -> Void {
        optionTitleLabel.text = option.getRawValue()
        optionTitleLabel.textColor = isEnable ? Colors.BLACK_COLOR : Colors.WHITE_COLOR
        let title = option.getRawValue()
        if title.contains("Remove") || title.contains("Cancel") {
            optionTitleLabel.textColor =  Colors.RED_COLOR
        }
       
        //optionTitleLabel.textColor = CameraMenuOptions.removePhoto.getRawValue() == optionTitleLabel.text ? ThemeManager.shared.appTheme.RED_COLOR : ThemeManager.shared.appTheme.BLACK_COLOR
               
    }
}

class MenuOptionPopUpVC: UIViewController, UITableViewDelegate,UITableViewDataSource,PanModalPresentable  {

    @IBOutlet var tableView: UITableView!
    
    var selectionHandler:MenuOptionSelectionCompletionHandler?
    
    var options = [MenuOptions]()
    var selectedOption:MenuOptions?
    var isEnable = true
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        panModalTransition(to: .longForm)
        tableView.roundWithCorners(corners: [.layerMinXMinYCorner,.layerMaxXMinYCorner], radius: 10)
        tableView.clipsToBounds = true
    }
    
    //MARK: UITableViewDelegate,UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PopUpOptionTableViewCell.className, for: indexPath) as! PopUpOptionTableViewCell
        cell.configureCell(option: options[indexPath.row], isEnable: self.isEnable)
        return cell
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.removeSelection()
        
        dismiss(animated: true) {
            self.selectionHandler?(self.options[indexPath.row])
        }
        
    }
    
    
    // MARK: - Pan Modal Presentable
    
    var panScrollable: UIScrollView? {
        return tableView
    }
    
    var anchorModalToLongForm: Bool {
        return false
    }
    
    var shouldRoundTopCorners: Bool {
        return true
    }
    
    var shortFormHeight: PanModalHeight {
        return longFormHeight
    }
    
    func willTransition(to state: PanModalPresentationController.PresentationState) {
        panModalSetNeedsLayoutUpdate()
    }
}

