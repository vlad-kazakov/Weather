//
//  MainModel.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 11.08.2022.
//

import Foundation

struct Main: Decodable {
    let temp: Double
    let tempMin: Double
    let tempMax: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"

    }
}

extension Main {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        temp = try container.decode(Double.self, forKey: .temp)
        tempMin = try container.decode(Double.self, forKey: .tempMin)
        tempMax = try container.decode(Double.self, forKey: .tempMax)

    }
}

