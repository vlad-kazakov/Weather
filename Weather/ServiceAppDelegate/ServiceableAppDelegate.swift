//
//  ServiceableAppDelegate.swift
//  7LL
//
//  Created by Egor Egorov on 28.10.2020.
//  Copyright © 2020 mobindustry. All rights reserved.
//

import UIKit

class ServiceableAppDelegate: UIResponder, UIApplicationDelegate {
    
    typealias WindowProvider = Coordinator & AppWindowProvider
    
    var window: UIWindow?
    
    var applicationCoordinator: WindowProvider?
    
    var launchServices: [AppLaunchService] {
        return []
    }
    
    var lifecycleServices: [AppLifecycleService] {
        return []
    }
    
    var deeplinksServices: [AppDeeplinksService] {
        return []
    }
    
    var pushNotificationsService: AppPushNotificationsService? {
        return nil
    }
    
    var activityServices: [AppUserActivityService] {
        return []
    }
    
    
}
