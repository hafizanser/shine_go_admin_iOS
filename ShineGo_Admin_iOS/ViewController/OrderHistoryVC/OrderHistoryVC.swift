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
    
    var completeOrdersArray = [HomeModel]()
    var cancelOrdersArray = [HomeModel]()
    var currentOrdersArray = [HomeModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setupUI()
    }
    
    //MARK: - Helper Functions
    private func setupUI(){
        tableViewSetup()
        currentOrdersArray = completeOrdersArray
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
        let obj5 = HomeModel(title: "Gold Shine",time: "11 - 23 Mins",phone: "+2 3245986",address: "Ichra Bazar",appointment: "Today 10:00")
        
        completeOrdersArray.append(obj1)
        completeOrdersArray.append(obj2)
        completeOrdersArray.append(obj3)
        completeOrdersArray.append(obj4)
        completeOrdersArray.append(obj5)
        
        let obj6 = HomeModel(title: "Gold Shine",time: "10 - 30 Mins",phone: "+92 1245986",address: "Ichra bazar Mazang",appointment: "Today 5:00")
        let obj7 = HomeModel(title: "Gold Shine",time: "12 - 34 Mins",phone: "+92 32459086",address: "Qataba chowk",appointment: "Today 3:00")
        let obj8 = HomeModel(title: "Gold Shine",time: "12 - 34 Mins",phone: "+92 32459086",address: "Qataba chowk",appointment: "Today 3:00")
        
        cancelOrdersArray.append(obj6)
        cancelOrdersArray.append(obj7)
        cancelOrdersArray.append(obj8)
        
    }
    private func updateButtonUI(isTodaySelected: Bool) {
        if isTodaySelected {
            lblCompleteOrders.textColor = .white
            lblCancelOrders.textColor = .gray
            imgCompleteOrder.backgroundColor = .white
            imgCancelOrders.backgroundColor = .clear
        } else {
            lblCancelOrders.textColor = .white
            lblCompleteOrders.textColor = .gray
            imgCancelOrders.backgroundColor = .white
            imgCompleteOrder.backgroundColor = .clear
        }
    }

    //MARK: - IBActions
    @IBAction func completeOrdersButtonWasPressed(_ sender: Any) {
        updateButtonUI(isTodaySelected: true)
        currentOrdersArray = completeOrdersArray
        tableView.reloadData()
    }
    
    @IBAction func cancelOrdersButtonWaspressed(_ sender: Any) {
        updateButtonUI(isTodaySelected: false)
        currentOrdersArray = cancelOrdersArray
        tableView.reloadData()
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension OrderHistoryVC: UITableViewDataSource, UITableViewDelegate {
    
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
