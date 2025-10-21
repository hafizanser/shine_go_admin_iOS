//
//  HomesVC.swift
//  ShineGo
//
//  Created by Ahmad Malik on 10/16/25.
//

import UIKit

class HomesVC: UIViewController {

    @IBOutlet weak var imgUpcomingOrders: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imgTodayOrder: UIImageView!
    @IBOutlet weak var lblUpcomingOrders: UILabel!
    @IBOutlet weak var lblTodayOrders: UILabel!
    
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
    @IBAction func todayOrdersButtonWasPressed(_ sender: Any) {
        lblTodayOrders.textColor = UIColor.white
        lblUpcomingOrders.textColor = UIColor.gray
        imgTodayOrder.backgroundColor = UIColor.white
        imgUpcomingOrders.backgroundColor = UIColor.clear
    }
    
    @IBAction func upcomingOrdersButtonWaspressed(_ sender: Any) {
        lblUpcomingOrders.textColor = UIColor.white
        lblTodayOrders.textColor = UIColor.gray
        imgUpcomingOrders.backgroundColor = UIColor.white
        imgTodayOrder.backgroundColor = UIColor.clear
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension HomesVC: UITableViewDataSource, UITableViewDelegate {
    
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
