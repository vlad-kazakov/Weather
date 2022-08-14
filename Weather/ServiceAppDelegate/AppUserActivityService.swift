//
//  AppUserActivityService.swift
//  7LL
//
//  Created by Egor Egorov on 28.10.2020.
//  Copyright © 2020 mobindustry. All rights reserved.
//

import UIKit

protocol AppUserActivityService {
    
    func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool
    func application(_ application: UIApplication, didFailToContinueUserActivityWithType userActivityType: String, error: Error)
    func application(_ application: UIApplication, didUpdate userActivity: NSUserActivity)
}

// MARK: - User Activity

extension ServiceableAppDelegate {
    
    func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
        
        for service in activityServices {
            if service.application(application, willContinueUserActivityWithType: userActivityType) {
                return true
            }
        }
        
        return false
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        
        for service in activityServices {
            if service.application(application, continue: userActivity, restorationHandler: restorationHandler) {
                return true
            }
        }
        
        return false
    }
    
    func application(_ application: UIApplication, didFailToContinueUserActivityWithType userActivityType: String, error: Error) {
        
        for service in activityServices {
            service.application(application, didFailToContinueUserActivityWithType: userActivityType, error: error)
        }
    }
    
    func application(_ application: UIApplication, didUpdate userActivity: NSUserActivity) {
        
        for service in activityServices {
            service.application(application, didUpdate: userActivity)
        }
    }
}
