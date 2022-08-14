//
//  HomeViewController.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 08.08.2022.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    func reloadData()
}

class HomeViewController: UIViewController, StoryboardCreatable, HomeViewControllerProtocol {
    static var storyboardName: String { return R.storyboard.main.name }
    
    // MARK: - Private properties

    @IBOutlet private var searchBar: UISearchBar!
    {
        didSet {
            searchBar.delegate = self
        }
    }

    @IBOutlet private var tableView: UITableView!
    {
        didSet {
            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = 100
            tableViewDataSource = HomeTableViewDatasource()
            tableView.delegate = self
        }
    }
    
    private var tableViewDataSource: HomeTableViewDatasource? {
        didSet {
            tableView.dataSource = tableViewDataSource
        }
    }
    
    // MARK: - Public properties

    var viewModel: HomeViewModel!
    {
        didSet {
            self.viewModel.updateData()
        }
    }

    // MARK: - Overridden methods

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - HomeViewControllerProtocol
    
    func reloadData() {
        tableViewDataSource?.items = viewModel?.items ?? []
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.goWeatherDetails(id: tableViewDataSource?.items[indexPath.row].id ?? "")
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - UISearchBarDelegate

extension HomeViewController: UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText:String)
    {
        viewModel.searchAction.perform(with: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
    }
}

