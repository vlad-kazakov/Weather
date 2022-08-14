//
//  AppCoordinator.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 08.08.2022.
//

import UIKit

final class AppCoordinator: Coordinator{
    func start() {
        startApplicationFlow()
    }
}

// MARK: - AppWindowProvider

extension AppCoordinator: AppWindowProvider {
    func window() -> UIWindow {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = UIColor.white
        window.makeKeyAndVisible()
        
        return window
    }
}

// MARK: - Private methods

private extension AppCoordinator {
    func startApplicationFlow() {
        startMainFlow()
    }
    
    func startMainFlow() {
        let controller = HomeCoordinator().configure()
        UIApplication.shared.setRootViewController(controller)
    }
    
    func startOnboardingFlow() {
    }
    
    func startLoginFlow() {
    }
}

