//
//  AppPushNotificationsService.swift
//
//

import UIKit

protocol AppPushNotificationsService {
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error)
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any])
    
    func application(
        _ application: UIApplication,
        didReceiveRemoteNotification userInfo: [AnyHashable : Any],
        fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void)
    
    func application(
        _ application: UIApplication,
        handleActionWithIdentifier identifier: String?,
        forRemoteNotification userInfo: [AnyHashable : Any],
        withResponseInfo responseInfo: [AnyHashable : Any],
        completionHandler: @escaping () -> Void)
    
    func application(
        _ application: UIApplication,
        handleActionWithIdentifier identifier: String?,
        forRemoteNotification userInfo: [AnyHashable : Any],
        completionHandler: @escaping () -> Void)
}

extension AppPushNotificationsService {
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {}
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {}
    
    func application(
        _ application: UIApplication,
        didReceiveRemoteNotification userInfo: [AnyHashable : Any],
        fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        completionHandler(.noData)
    }
    
    func application(
        _ application: UIApplication,
        handleActionWithIdentifier identifier: String?,
        forRemoteNotification userInfo: [AnyHashable : Any],
        withResponseInfo responseInfo: [AnyHashable : Any],
        completionHandler: @escaping () -> Void) {
        
        completionHandler()
    }
    
    func application(
        _ application: UIApplication,
        handleActionWithIdentifier identifier: String?,
        forRemoteNotification userInfo: [AnyHashable : Any],
        completionHandler: @escaping () -> Void) {
        
        completionHandler()
    }
}

// MARK: - Push notifications

extension ServiceableAppDelegate {
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        pushNotificationsService?.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
        pushNotificationsService?.application(application, didFailToRegisterForRemoteNotificationsWithError: error)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        
        pushNotificationsService?.application(application, didReceiveRemoteNotification: userInfo)
    }
    
    func application(
        _ application: UIApplication,
        didReceiveRemoteNotification userInfo: [AnyHashable : Any],
        fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        pushNotificationsService?.application(
            application,
            didReceiveRemoteNotification: userInfo,
            fetchCompletionHandler: completionHandler
        )
    }
    
    func application(
        _ application: UIApplication,
        handleActionWithIdentifier identifier: String?,
        forRemoteNotification userInfo: [AnyHashable : Any],
        withResponseInfo responseInfo: [AnyHashable : Any],
        completionHandler: @escaping () -> Void) {
        
        pushNotificationsService?.application(
            application,
            handleActionWithIdentifier: identifier,
            forRemoteNotification: userInfo,
            withResponseInfo: responseInfo,
            completionHandler: completionHandler
        )
    }
    
    func application(
        _ application: UIApplication,
        handleActionWithIdentifier identifier: String?,
        forRemoteNotification userInfo: [AnyHashable : Any],
        completionHandler: @escaping () -> Void) {
        
        pushNotificationsService?.application(
            application,
            handleActionWithIdentifier: identifier,
            forRemoteNotification: userInfo,
            completionHandler: completionHandler
        )
    }
}
