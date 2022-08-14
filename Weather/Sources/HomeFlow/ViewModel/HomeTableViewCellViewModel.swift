//
//  HomeTableViewCellViewModel.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 08.08.2022.
//

import Foundation
import UIKit

struct HomeTableViewCellViewModel {
    
    // MARK: - Properties

    var city: String
    var currentTemperature: Int
    var minTemperature: Int
    var maxTemperature: Int
    var weatherImageUrl: URL?
    var weatherDescription: String
    var id: String
    var date: Date?

    typealias This = HomeTableViewCellViewModel

    // MARK: - Inits

    init(weather: WeatherModel) {
        city = weather.name
        maxTemperature = Int(weather.main.tempMax)
        minTemperature = Int(weather.main.tempMin)
        currentTemperature = Int(weather.main.temp)
        id = String(weather.id)
        weatherDescription = ""
        
        if !weather.weatherList.isEmpty{
            weatherDescription = weather.weatherList[0].description
            weatherImageUrl = URL(string: "http://openweathermap.org/img/wn/\(weather.weatherList[0].icon)@2x.png")
        }
    }
    
    init(weather: WeatherListModel, city: String) {
        self.city = city
        maxTemperature = Int(weather.main.tempMax)
        minTemperature = Int(weather.main.tempMin)
        currentTemperature = Int(weather.main.temp)
        id = ""
        date = weather.date
        weatherDescription = ""
        
        if !weather.weatherList.isEmpty{
            weatherDescription = weather.weatherList[0].description
            weatherImageUrl = URL(string: "http://openweathermap.org/img/wn/\(weather.weatherList[0].icon)@2x.png")
        }
    }
}
