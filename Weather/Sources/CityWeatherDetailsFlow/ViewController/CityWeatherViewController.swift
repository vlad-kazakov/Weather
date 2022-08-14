//
//  CityWeatherViewController.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 11.08.2022.
//

import UIKit

protocol CityWeatherViewControllerProtocol: AnyObject {
    func reloadData()
}

class CityWeatherViewController: UIViewController, StoryboardCreatable, CityWeatherViewControllerProtocol {
    static var storyboardName: String { return R.storyboard.main.name }

    // MARK: - Private properties
    
    @IBOutlet private var tableView: UITableView!
    {
        didSet {
            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = 100
            tableViewDataSource = CityWeatherTableViewDatasource()
            tableView.delegate = self
        }
    }
    
    private var tableViewDataSource: CityWeatherTableViewDatasource? {
        didSet {
            tableView.dataSource = tableViewDataSource
        }
    }
    
    // MARK: - Public properties
    
    var viewModel: CityWeatherViewModel!
    {
        didSet {
            self.viewModel.updateData()
        }
    }
    
    // MARK: - Overridden methods

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - CityWeatherViewControllerProtocol

    func reloadData() {
        tableViewDataSource?.items = viewModel?.items ?? []
        tableView.reloadData()
    }

}

// MARK: - UITableViewDelegate

extension CityWeatherViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
