//
//  HomeViewModel.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 08.08.2022.
//

import Foundation
protocol HomeViewModelProtocol where Self: AnyObject {
    var items: [HomeTableViewCellViewModel] { get }
    var searchAction: CommandWith<String> { get }
    var initialSearchText: String? { get }
    func goWeatherDetails(id: String)
    func updateData()
}

final class HomeViewModel: HomeViewModelProtocol {

    // MARK: - Private properties

    private var model: [WeatherModel] = []
    private weak var view: HomeViewControllerProtocol!
    private let coordinator: HomeCoordinatorProtocol
    private let weatherAPI: WeatherApiClienttProtocol
    
    private var searchText: String? {
        didSet {
            guard let text = self.searchText else { return }
            if text.count > 0  {
                self.createSearchItems()
            } else {
                self.createItems()
            }
            self.view.reloadData()
        }
    }
    
    // MARK: - Inits

    init(coordinator: HomeCoordinatorProtocol,
         view: HomeViewControllerProtocol,
         weatherApi: WeatherApiClienttProtocol = WeatherApiClient()) {
        self.view = view
        self.coordinator = coordinator
        self.weatherAPI = weatherApi
    }
    
    // MARK: - HomeViewModelProtocol
    
    lazy var searchAction: CommandWith<String> = {
        return .init { [unowned self] text in
            self.searchText = text
        }
    }()
    
    var initialSearchText: String? {
        return searchText
    }
    
    private(set) var items: [HomeTableViewCellViewModel] = []
    
    func goWeatherDetails(id: String) {
        self.coordinator.toDetails(cityId: id)
    }
    
    func updateData() {
        if let path = R.file.cityJson.path()
        {
            if let jsonData = NSData(contentsOfFile: path)
            {
                do {
                    let object = try JSONSerialization.jsonObject(with: jsonData as Data, options: .allowFragments)
                    if let dictionary = object as? [String: String] {
                        print(dictionary.values)
                        self.initialFetchData(cityList: dictionary.values.compactMap{$0})
                    }
                } catch {
                    print("Error!!!")
                }
            }
        }
    }
}

// MARK: - Actions

private extension HomeViewModel {
    func createItems() {
        items = model.map {
            return HomeTableViewCellViewModel(weather: $0)
        }
    }
    
    func createSearchItems() {
        if let search = searchText {
            items = items.filter({ $0.city.contains(search)})
        }
    }
}

// MARK: - API Calls

private extension HomeViewModel {
    
    func initialFetchData(cityList: [String]) {
        let queue = DispatchQueue(label: "com.getWeather", attributes: .concurrent, target: .main)
        let group = DispatchGroup()
        
        for cityId in cityList {
            group.enter()
            queue.async(group: group) {
                self.weatherAPI.getWeatherCityById(id: cityId, completion: { [weak self] result in
                    group.leave()
                    switch result {
                    case .success(let weather):
                        print(weather)
                        self?.model.append(weather)
                    case .failure:
                        print("")
                    }
                })
            }
        }
        
        group.notify(queue: DispatchQueue.main) {
            self.coordinator.hideLoading()
            self.createItems()
            self.view.reloadData()
        }
    }
}
