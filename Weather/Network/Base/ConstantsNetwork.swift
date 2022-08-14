//
//  ConstantsNetwork.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 08.08.2022.
//

import UIKit

struct KNetwork {
    struct ProductionServer {
        static let baseURL = "https://api.openweathermap.org/data/2.5/"
    }
    
    struct weather {
        static let appId = "appid"
        static let cityId = "id"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "multipart/form-data"
}

