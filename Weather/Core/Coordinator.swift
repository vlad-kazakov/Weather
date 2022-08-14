//
//  Coordinator.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 08.08.2022.
//

import Foundation

protocol Coordinator where Self: AnyObject {
    func start()
    func close()
    func showLoading()
    func hideLoading(completion: (() -> Void)?)
}

extension Coordinator {
    func close() {}
    
    func showLoading() {}
    
    func hideLoading(completion: (() -> Void)? = nil) {}
}
