//
//  City.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 11.08.2022.
//

import Foundation

struct City: Decodable {
    let name: String

    enum CodingKeys: String, CodingKey {
        case name

    }
}

extension City {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
}

