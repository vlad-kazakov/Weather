//
//  AppDeeplinksService.swift
//
//

import UIKit
protocol AppDeeplinksService {
    
    func openUrl(_ url: URL,
                 withOptions options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool
}

// MARK: - Routing

extension ServiceableAppDelegate {
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return false
    }
    
}

