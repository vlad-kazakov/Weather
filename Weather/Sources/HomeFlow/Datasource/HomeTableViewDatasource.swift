//
//  HomeTableViewDatasource.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 08.08.2022.
//

import UIKit.UITableView

class HomeTableViewDatasource: NSObject, UITableViewDataSource {
    
    // MARK: - Public properties

    var items = [HomeTableViewCellViewModel]()
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.viewModel = items[indexPath.row]
        return cell
    }
}
