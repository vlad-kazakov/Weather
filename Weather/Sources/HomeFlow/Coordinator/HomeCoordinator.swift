//
//  HomeCoordinator.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 08.08.2022.
//

import UIKit

protocol HomeCoordinatorProtocol: Coordinator {
    func toDetails(cityId: String)
}

final class HomeCoordinator: HomeCoordinatorProtocol {

    func toDetails(cityId: String) {
        let coordinator = CityWeatherCoordinator(navigation: navigation!, cityId: cityId)
        coordinator.start()
    }
    
    // MARK: - Private properties
    
    private var navigation: UINavigationController?

    // MARK: - Inits
    
    init(navigation: UINavigationController? = nil) {
        self.navigation = navigation
    }
}

// MARK: - ModuleConfigurable

extension HomeCoordinator: ModuleConfigurable {
    func configure() -> UIViewController {
        let controller = HomeViewController.createFromStoryboard()
        navigation = UINavigationController(rootViewController: controller)
        let viewModel = HomeViewModel(coordinator: self, view: controller)
        controller.viewModel = viewModel
        return navigation!
    }

}

// MARK: - HomeCoordinatorProtocol

extension HomeCoordinator {
    func start() {
        fatalError("Need to use configure()")
    }
}
