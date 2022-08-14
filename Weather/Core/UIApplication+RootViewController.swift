//
//  UIApplication+RootViewController.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 08.08.2022.
//

import UIKit

extension UIApplication {
    
    func setRootViewController(_ controller: UIViewController?, animated: Bool = true) {
        
        guard
            let window = baseWindow,
            let controller = controller
        else { return }
            
        window.rootViewController = controller
            
        if animated {
            UIView.animate(withDuration: 1.6,
                           delay: 0.0,
                           options: [.curveEaseOut],
                           animations: {
                            controller.view.alpha = 0.0
                            controller.view.alpha = 1.0
                           },
                           completion: nil)
        }
    }
    
    private var baseWindow: UIWindow? {
        return UIApplication.shared.windows.filter { $0.isKeyWindow }.first
    }
}
