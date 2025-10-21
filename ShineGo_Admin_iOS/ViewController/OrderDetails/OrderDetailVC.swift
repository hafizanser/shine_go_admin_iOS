//
//  orderDetailVC.swift
//  ShineGo
//
//  Created by Ahmad Malik on 10/17/25.
//

import UIKit

class orderDetailsVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    

    //MARK: - Helper Functions
    private func setupUI(){
      tableViewSetup()
    }
    private func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UINib(nibName: washTypeCell.className, bundle: nil), forCellReuseIdentifier: washTypeCell.className)
        tableView.register(UINib(nibName: MapCell.className, bundle: nil), forCellReuseIdentifier: MapCell.className)
        tableView.register(UINib(nibName: BeforeImagesCell.className, bundle: nil), forCellReuseIdentifier: BeforeImagesCell.className)
        tableView.register(UINib(nibName: AfterImagesCell.className, bundle: nil), forCellReuseIdentifier: AfterImagesCell.className)
    }
    
    private func openInGoogleMaps(latitude: Double, longitude: Double, placeName: String) {
        let googleMapsURLString = "comgooglemaps://?q=\(latitude),\(longitude)&center=\(latitude),\(longitude)&zoom=14"
        let webURLString = "https://www.google.com/maps/search/?api=1&query=\(latitude),\(longitude)"
        if let googleMapsURL = URL(string: googleMapsURLString),
           UIApplication.shared.canOpenURL(googleMapsURL) {
            UIApplication.shared.open(googleMapsURL, options: [:], completionHandler: nil)
        } else if let webURL = URL(string: webURLString) {
            UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
        }
    }
    // MARK: - Google Maps (Address Based)
    private func openAddressInGoogleMaps(address: String) {
        let encodedAddress = address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let googleMapsURLString = "comgooglemaps://?q=\(encodedAddress)"
        let webURLString = "https://www.google.com/maps/search/?api=1&query=\(encodedAddress)"
        
        if let googleMapsURL = URL(string: googleMapsURLString),
           UIApplication.shared.canOpenURL(googleMapsURL) {
            UIApplication.shared.open(googleMapsURL, options: [:], completionHandler: nil)
        } else if let webURL = URL(string: webURLString) {
            UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
        }
    }

    // MARK: - Phone Call
    private func makePhoneCall(phoneNumber: String) {
        
        let cleanedNumber = phoneNumber.replacingOccurrences(of: " ", with: "")
        
        if let phoneURL = URL(string: "tel://\(cleanedNumber)"),
           UIApplication.shared.canOpenURL(phoneURL) {
            UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
        } else {
            
            let alert = UIAlertController(title: "Error", message: "Your device cannot make calls.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }

    //MARK: - IBActions
}
extension orderDetailsVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: washTypeCell.className, for: indexPath) as! washTypeCell
            cell.selectionStyle = .none
            cell.locationButtonTapped = {[weak self] in
                guard let self = self else { return }
                let address = cell.lblLocation.text ?? ""
                self.openAddressInGoogleMaps(address: address)
            }
            cell.callButtonTapped = {
                let phoneNumber = cell.lblPhoneNumber.text ?? ""
                self.makePhoneCall(phoneNumber: phoneNumber)
            }
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: MapCell.className, for: indexPath) as! MapCell
            cell.selectionStyle = .none
            cell.mapButtonTapped = {[weak self] in
                guard let self = self else { return }
                let latitude = 37.7749
                let longitude = -122.4194
                let locationName = "Customer Location"
                
                self.openInGoogleMaps(latitude: latitude, longitude: longitude, placeName: locationName)
            }
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: BeforeImagesCell.className, for: indexPath) as! BeforeImagesCell
            cell.selectionStyle = .none
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: AfterImagesCell.className, for: indexPath) as! AfterImagesCell
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 324
        case 1:
            return 283
        case 2:
            return 154
        case 3:
            return 154
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}



