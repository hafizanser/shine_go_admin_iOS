//
//  ProfilesVC.swift
//  ShineGo
//
//  Created by Ahmad Malik on 10/20/25.
//

import UIKit

class ProfilesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblGmail: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgPerson: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Helper Functions
    private func setupUI() {
        tableViewSetup()
    }
    
    private func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UINib(nibName: privacyPolicyCell.className, bundle: nil),
                           forCellReuseIdentifier: privacyPolicyCell.className)
        tableView.register(UINib(nibName: logoutCell.className, bundle: nil),
                           forCellReuseIdentifier: logoutCell.className)
    }
}

// MARK: - UITableView Delegate & DataSource
extension ProfilesVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: privacyPolicyCell.className,
                for: indexPath
            ) as! privacyPolicyCell
            cell.selectionStyle = .none
            cell.privacyPolicyButtonTapped = {
                
            }
            cell.termsAndConditionButtonTapped = {
                
            }
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: logoutCell.className,for: indexPath
            ) as! logoutCell
            cell.selectionStyle = .none
            cell.logoutButtonTapped = {
                
            }
            cell.deleteMyAccountButtonTapped = {
                
            }
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView,heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 170
        case 1:
            return 228
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        
    }
}
