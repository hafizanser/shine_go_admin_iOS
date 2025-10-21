//
//  OrderHistoryVC.swift
//  ShineGo_Admin_iOS
//
//  Created by Asad Hamza on 21/10/2025.
//

import UIKit

class OrderHistoryVC: UIViewController {
    @IBOutlet weak var imgCancelOrders: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imgCompleteOrder: UIImageView!
    @IBOutlet weak var lblCancelOrders: UILabel!
    @IBOutlet weak var lblCompleteOrders: UILabel!
    
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
        tableView.register(UINib(nibName: BookingsCell.className, bundle: nil), forCellReuseIdentifier: BookingsCell.className)
    }

    //MARK: - IBActions
    @IBAction func completeOrdersButtonWasPressed(_ sender: Any) {
        lblCompleteOrders.textColor = UIColor.white
        lblCancelOrders.textColor = UIColor.gray
        imgCompleteOrder.backgroundColor = UIColor.white
        imgCancelOrders.backgroundColor = UIColor.clear
    }
    
    @IBAction func cancelOrdersButtonWaspressed(_ sender: Any) {
        lblCancelOrders.textColor = UIColor.white
        lblCompleteOrders.textColor = UIColor.gray
        imgCancelOrders.backgroundColor = UIColor.white
        imgCompleteOrder.backgroundColor = UIColor.clear
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension OrderHistoryVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookingsCell.className, for: indexPath) as! BookingsCell
        cell.selectionStyle = .none
        cell.nextButtonTapped = {
            Router.shared.openorderDetailsVC(controller: self)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 174
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
