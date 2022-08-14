//
//  CityWeatherViewModel.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 11.08.2022.
//

import Foundation
protocol CityWeatherViewModelProtocol where Self: AnyObject {
    var items: [HomeTableViewCellViewModel] { get }
    func updateData()
}

final class CityWeatherViewModel: CityWeatherViewModelProtocol {
    
    // MARK: - Private properties
    
    private var model: WeatherCityDetailsModel?
    
    private weak var view: CityWeatherViewControllerProtocol!
    private let coordinator: CityWeatherCoordinator
    private let weatherAPI: WeatherApiClienttProtocol
    private let cityId: String

    // MARK: - Inits

    init(coordinator: CityWeatherCoordinator,
         view: CityWeatherViewControllerProtocol,
         weatherApi: WeatherApiClienttProtocol = WeatherApiClient(), cityId: String) {
        self.view = view
        self.coordinator = coordinator
        self.weatherAPI = weatherApi
        self.cityId = cityId
    }
    
    // MARK: - CityWeatherViewModelProtocol
  
    private(set) var items: [HomeTableViewCellViewModel] = []

    func updateData() {
        self.getWeather()
    }
}

// MARK: - Actions

private extension CityWeatherViewModel {
    func createItems() {
        guard let model = model else {return}
        let cityName = model.city.name
        items = model.list.map {
            return HomeTableViewCellViewModel(weather: $0, city: cityName)
        }
    }
}

// MARK: - API Calls

private extension CityWeatherViewModel {
    func getWeather() {
        self.weatherAPI.getWeatherCitySeveralDays(id: cityId, completion: { [weak self] result in
            switch result {
            case .success(let weather):
                print(weather)
                self?.model = weather
                self?.createItems()
                self?.view.reloadData()
            case .failure:
                print("")
            }
        })
    }
}
