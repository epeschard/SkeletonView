//
//  AppDelegate.swift
//  SkeletonView
//
//  Created by Eugène Peschard on 21/02/2019.
//  Copyright © 2019 pesch.app. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        defer { window?.makeKeyAndVisible() }
        
        guard NSClassFromString("XCTest") == nil else {
            window?.rootViewController = UIViewController()
            return true
        }        
        window?.rootViewController = ViewController()
        
        return true
    }

}

