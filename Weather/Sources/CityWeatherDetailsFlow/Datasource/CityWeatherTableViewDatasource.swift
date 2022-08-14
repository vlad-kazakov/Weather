//
//  CityWeatherTableViewDatasource.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 11.08.2022.
//

import UIKit.UITableView

class CityWeatherTableViewDatasource: NSObject, UITableViewDataSource {
    
    // MARK: - Public properties

    var items = [HomeTableViewCellViewModel]()
    
    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CityWeatherCell", for: indexPath) as! CityWeatherCell
            cell.viewModel = items[indexPath.row]
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityWeatherDayCell", for: indexPath) as! CityWeatherDayCell
        cell.viewModel = items[indexPath.row]
        return cell
    }
}
