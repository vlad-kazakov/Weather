//
//  WeatherListModel.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 11.08.2022.
//

import Foundation

struct WeatherListModel: Decodable {
    let date: Date
    let main: Main
    let weatherList: [Weather]



    enum CodingKeys: String, CodingKey {
        case date = "dt_txt"
        case main
        case weather
    }
}

extension WeatherListModel {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dateString = try container.decode(String.self, forKey: .date)
        main = try container.decode(Main.self, forKey: .main)
        weatherList = try container.decode([Weather].self, forKey: .weather)
        date = Date().fromString(dateString)
    }
}
