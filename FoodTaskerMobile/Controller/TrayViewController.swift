//
//  TrayViewController.swift
//  FoodTaskerMobile
//
//  Created by Макс on 06/12/2018.
//  Copyright © 2018 Макс. All rights reserved.
//

import UIKit
import MapKit

class TrayViewController: UIViewController {

    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    @IBOutlet weak var tbvMeals: UITableView!
    @IBOutlet weak var viewTotal: UIView!
    @IBOutlet weak var viewAddress: UIView!
    @IBOutlet weak var viewMap: UIView!
    @IBOutlet weak var lbTotal: UILabel!
    @IBOutlet weak var tbAddress: UITextField!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var bAddPayment: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            menuBarButton.target = self.revealViewController()
            menuBarButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        if Tray.currentTray.items.count == 0 {
            // Showing a message here
            let lbEmptyTray = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 40))
            lbEmptyTray.center = self.view.center
            lbEmptyTray.textAlignment = NSTextAlignment.center
            lbEmptyTray.text = "Your tray is empty. Please, select meal."
            self.view.addSubview(lbEmptyTray)
        }else {
            // Display all the UI controllers
            self.tbvMeals.isHidden = false
            self.viewTotal.isHidden = false
            self.viewAddress.isHidden = false
            self.bAddPayment.isHidden = false
            self.viewMap.isHidden = false
            
            loadMeals()
        }

    }
    
    func loadMeals() {
        self.tbvMeals.reloadData()
        self.lbTotal.text = "$\(Tray.currentTray.getTotal())"
    }

}

extension TrayViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Tray.currentTray.items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trayItemCell", for: indexPath) as! TrayViewCell
        
        let tray = Tray.currentTray.items[indexPath.row]
        cell.lbQty.text = "\(tray.qty)"
        cell.lbMealName.text = tray.meal.name
        cell.lbSubTotal.text = "$\(tray.meal.price! * Float(tray.qty))"
        
        return cell
    }
}
