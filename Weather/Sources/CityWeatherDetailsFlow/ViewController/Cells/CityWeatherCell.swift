//
//  CityWeatherCell.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 11.08.2022.
//

import UIKit

final class CityWeatherCell: UITableViewCell {
    
    // MARK: - Private properties

    @IBOutlet private var cityLabel: UILabel!
    @IBOutlet private var temperatureLabel: UILabel!
    @IBOutlet private var weatherImageView: UIImageView!
    @IBOutlet private var minMaxLabel: UILabel!
    
    // MARK: - Public properties

    var viewModel: HomeTableViewCellViewModel? {
        didSet {
            render()
        }
    }

    // MARK: - Overridden

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Private methods

    private func render () {
        if let model = viewModel {
            cityLabel.text = model.city
            temperatureLabel.text = "\(model.currentTemperature)F"
            minMaxLabel.text = "min: \(String(model.minTemperature))F - max: \(String(model.maxTemperature))F"
            weatherImageView?.kf.setImage(with: model.weatherImageUrl)
        }

    }
}
