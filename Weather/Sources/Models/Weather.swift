//
//  Weather.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 11.08.2022.
//

import Foundation

struct Weather: Decodable {
    let description: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case description
        case icon

    }
  
}

extension Weather {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        description = try container.decode(String.self, forKey: .description)
        icon = try container.decode(String.self, forKey: .icon)
    }
}

