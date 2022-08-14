//
//  AppLifecycleService.swift
//  7LL
//
//  Created by Egor Egorov on 28.10.2020.
//  Copyright © 2020 mobindustry. All rights reserved.
//

import UIKit

protocol AppLifecycleService {
    
    func applicationDidBecomeActive(_ application: UIApplication)
    func applicationWillResignActive(_ application: UIApplication)
    func applicationDidReceiveMemoryWarning(_ application: UIApplication)
    func applicationWillTerminate(_ application: UIApplication)
    func applicationDidEnterBackground(_ application: UIApplication)
    func applicationWillEnterForeground(_ application: UIApplication)
}

extension AppLifecycleService {
    func applicationDidBecomeActive(_ application: UIApplication) {}
    func applicationWillResignActive(_ application: UIApplication) {}
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {}
    func applicationWillTerminate(_ application: UIApplication) {}
    func applicationDidEnterBackground(_ application: UIApplication) {}
    func applicationWillEnterForeground(_ application: UIApplication) {}
}

// MARK: - Lifecycle

extension ServiceableAppDelegate {
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
        lifecycleServices.forEach {
            $0.applicationDidBecomeActive(application)
        }
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
        lifecycleServices.forEach {
            $0.applicationWillResignActive(application)
        }
    }
    
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        
        lifecycleServices.forEach {
            $0.applicationDidReceiveMemoryWarning(application)
        }
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
        lifecycleServices.forEach {
            $0.applicationWillTerminate(application)
        }
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
        lifecycleServices.forEach {
            $0.applicationDidEnterBackground(application)
        }
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
        lifecycleServices.forEach {
            $0.applicationWillEnterForeground(application)
        }
    }
}
