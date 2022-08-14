//
//  CityWeatherCoordinator.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 11.08.2022.
//

import UIKit

protocol CityWeatherCoordinatorProtocol: Coordinator {}

final class CityWeatherCoordinator: CityWeatherCoordinatorProtocol {

    // MARK: - Private properties
    
    private var navigation: UINavigationController
    private var cityId: String

    // MARK: - Inits
    
    init(navigation: UINavigationController, cityId: String) {
        self.navigation = navigation
        self.cityId = cityId
    }
}


// MARK: - CityWeatherCoordinatorProtocol

extension CityWeatherCoordinator {
    func start() {
        let controller = CityWeatherViewController.createFromStoryboard()
        let viewModel = CityWeatherViewModel(coordinator: self, view: controller, cityId: cityId)
        controller.viewModel = viewModel
        navigation.pushViewController(controller, animated: true)
    }
}
