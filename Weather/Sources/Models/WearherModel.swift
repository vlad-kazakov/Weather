//
//  WearherModel.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 08.08.2022.
//

import Foundation

struct WeatherModel: Decodable {
    let name: String
    let id: Int
    let main: Main
    let weatherList: [Weather]



    enum CodingKeys: String, CodingKey {
        case name
        case id
        case main
        case weather
    }
  
}

extension WeatherModel {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        id = try container.decode(Int.self, forKey: .id)
        main = try container.decode(Main.self, forKey: .main)
        weatherList = try container.decode([Weather].self, forKey: .weather)


    }
}
