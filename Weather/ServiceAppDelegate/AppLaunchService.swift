//
//  AppLaunchService.swift
//

import UIKit

protocol AppLaunchService {
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions)
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?)
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?)
}

extension AppLaunchService {
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) {}
}

// MARK: - Launching

extension ServiceableAppDelegate {
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        launchServices.forEach {
            $0.application(application, willFinishLaunchingWithOptions: launchOptions)
        }
        
        return true
    }
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        launchServices.forEach {
            $0.application(application, didFinishLaunchingWithOptions: launchOptions)
        }
        
        let windowProvider = AppCoordinator()
        window = windowProvider.window()
        window?.makeKeyAndVisible()
        
        applicationCoordinator = windowProvider
        applicationCoordinator?.start()
        
        return true
    }

}
