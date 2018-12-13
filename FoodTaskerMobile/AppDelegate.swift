//
//  AppDelegate.swift
//  FoodTaskerMobile
//
//  Created by Макс on 06/12/2018.
//  Copyright © 2018 Макс. All rights reserved.
//

import UIKit
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIApplication.shared.statusBarStyle = .lightContent
        
        UINavigationBar.appearance().barTintColor = UIColor(red: 0.19, green: 0.18, blue: 0.31, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return FBSDKApplicationDelegate.sharedInstance().application(_:application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        
        return (FBSDKApplicationDelegate.sharedInstance()?.application(app,
                                                                       open: url,
                                                                       sourceApplication:options [UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                                                                       annotation: nil))!
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        FBSDKAppEvents.activateApp()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

