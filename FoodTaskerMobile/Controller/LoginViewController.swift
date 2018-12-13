//
//  LoginViewController.swift
//  FoodTaskerMobile
//
//  Created by Макс on 10/12/2018.
//  Copyright © 2018 Макс. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var bLogin: UIButton!
    @IBOutlet weak var bLogout: UIButton!
    
    var fbLoginSuccess = false
    var userType: String = USERTYPE_CUSTOMER
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if FBSDKAccessToken.current() != nil {
            bLogout.isHidden = false
            FBManager.getFBUserData {
                
                self.bLogin.setTitle("Continue as \(String(describing: User.currentUser.email!))", for: .normal)
                //self.bLogin.sizeToFit()
            }
        } else {
            self.bLogout.isHidden = true
        }

    }
    override func viewDidAppear(_ animated: Bool) {
        if FBSDKAccessToken.current() != nil && fbLoginSuccess == true {
            performSegue(withIdentifier: "CustomerView", sender: self)
        }
    }
    
    
    @IBAction func facebookLogout(_ sender: Any) {
        
        APIManager.shared.logout { (error) in
            
            if error == nil {
                
                FBManager.shared.logOut()
                User.currentUser.resetInfo()
                self.bLogout.isHidden = true
                self.bLogin.setTitle("Login with Facebook", for: .normal)
            }
        }

    }
    
    @IBAction func facebookLogin(_ sender: Any) {
        
        if FBSDKAccessToken.current() != nil {
            
            APIManager.shared.login(userType: userType, completionHandler: { (error) in
                if error != nil {
                    print("we have errors")
                    print(error as Any)
                }
                else if error == nil {
                    self.fbLoginSuccess = true
                    self.viewDidAppear(true)
                }
                
            })
            
        }else{
            FBManager.shared.logIn(
                                   withReadPermissions: ["public_profile", "email"],
                                   from: self,
                                   handler: { (result, error) in
                                    if error == nil {
                                        FBManager.getFBUserData(completionHandler: {
                                            APIManager.shared.login(userType: self.userType, completionHandler: { (error) in
                                                if error == nil {
                                                    self.fbLoginSuccess = true
                                                    self.viewDidAppear(true)
                                                }
                                            })
                                        })

            }
        })
    }

}
}
