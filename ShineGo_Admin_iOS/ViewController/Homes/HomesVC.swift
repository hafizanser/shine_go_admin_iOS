//
//  HomesVC.swift
//  ShineGo
//
//  Created by Ahmad Malik on 10/16/25.
//

import UIKit
struct HomeModel {
    var title: String = ""
    var time: String = ""
    var phone: String = ""
    var address: String = ""
    var appointment: String = ""
    
}

class HomesVC: UIViewController {
    
    @IBOutlet weak var imgUpcomingOrders: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imgTodayOrder: UIImageView!
    @IBOutlet weak var lblUpcomingOrders: UILabel!
    @IBOutlet weak var lblTodayOrders: UILabel!
    
    var todayOrdersArray = [HomeModel]()
    var upcomingOrdersArray = [HomeModel]()
    var currentOrdersArray = [HomeModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Helper Functions
    private func setupUI(){
        tableViewSetup()
        currentOrdersArray = todayOrdersArray
        updateButtonUI(isTodaySelected: true)
    }
    
    private func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UINib(nibName: BookingsCell.className, bundle: nil), forCellReuseIdentifier: BookingsCell.className)
        
        let obj1 = HomeModel(title: "Gold Shine",time: "10 - 20 Mins",phone: "+23 3245986",address: "Jail Rd",appointment: "Today 12:00")
        let obj2 = HomeModel(title: "Gold Shine",time: "10 - 15 Mins",phone: "+1 3245986",address: "Lahore",appointment: "Today 1:00")
        let obj3 = HomeModel(title: "Gold Shine",time: "12 - 24 Mins",phone: "+91 3245986",address: "Chungi amar sidhu",appointment: "Today 11:00")
        let obj4 = HomeModel(title: "Gold Shine",time: "11 - 23 Mins",phone: "+2 3245986",address: "Ichra Bazar",appointment: "Today 10:00")
        
        todayOrdersArray.append(obj1)
        todayOrdersArray.append(obj2)
        todayOrdersArray.append(obj3)
        todayOrdersArray.append(obj4)
        
        let obj5 = HomeModel(title: "Gold Shine",time: "10 - 30 Mins",phone: "+92 1245986",address: "Ichra bazar Mazang",appointment: "Today 5:00")
        let obj6 = HomeModel(title: "Gold Shine",time: "12 - 34 Mins",phone: "+92 32459086",address: "Qataba chowk",appointment: "Today 3:00")
        
        upcomingOrdersArray.append(obj1)
        upcomingOrdersArray.append(obj2)
        
    }
    private func updateButtonUI(isTodaySelected: Bool) {
        if isTodaySelected {
            lblTodayOrders.textColor = .white
            lblUpcomingOrders.textColor = .gray
            imgTodayOrder.backgroundColor = .white
            imgUpcomingOrders.backgroundColor = .clear
        } else {
            lblUpcomingOrders.textColor = .white
            lblTodayOrders.textColor = .gray
            imgUpcomingOrders.backgroundColor = .white
            imgTodayOrder.backgroundColor = .clear
        }
    }
    
    //MARK: - IBActions
    @IBAction func todayOrdersButtonWasPressed(_ sender: Any) {
        updateButtonUI(isTodaySelected: true)
        currentOrdersArray = todayOrdersArray
        tableView.reloadData()
    }
    
    @IBAction func upcomingOrdersButtonWaspressed(_ sender: Any) {
        updateButtonUI(isTodaySelected: false)
        currentOrdersArray = upcomingOrdersArray
        tableView.reloadData()
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension HomesVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentOrdersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookingsCell.className, for: indexPath) as! BookingsCell
        cell.selectionStyle = .none
        let order = currentOrdersArray[indexPath.row]
        cell.lblCategory.text = order.title
        cell.lblArriveTime.text = order.time
        cell.lblPhoneNumber.text = order.phone
        cell.lblLocation.text = order.address
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
