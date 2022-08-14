//
//  WeatherCityDetailsModel.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 11.08.2022.
//

import Foundation

struct WeatherCityDetailsModel: Decodable {
    let city: City
    let list: [WeatherListModel]

    enum CodingKeys: String, CodingKey {
        case city
        case list
    }
}

extension WeatherCityDetailsModel {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        city = try container.decode(City.self, forKey: .city)
        let weatherList = try container.decode([WeatherListModel].self, forKey: .list)
      
        var res1: [WeatherListModel] = []
        weatherList.forEach { (p) -> () in
            if !res1.contains (where: { Calendar.current.isDate($0.date, equalTo: p.date, toGranularity: .day) }) {
                res1.append(p)
            }
        }
        
        list = res1
        
    }

}
