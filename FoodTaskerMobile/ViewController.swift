//
//  ViewController.swift
//  FoodTaskerMobile
//
//  Created by Макс on 06/12/2018.
//  Copyright © 2018 Макс. All rights reserved.
//

import UIKit

extension UIApplication {
    
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
    
}

class ViewController: UIViewController{
    
    /*override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }*/
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.setNeedsStatusBarAppearanceUpdate()
        //UIApplication.shared.statusBarView?.backgroundColor = UIColor(red: 0.19, green: 0.18, blue: 0.31, alpha: 1.0)

    }



}

