//
//  WeatherApiRouter.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 08.08.2022.
//

import Foundation
import Alamofire

private let kAppId = "0cd74bf29e43ef1ad6afd6861cc99eb2"

enum WeatherApiRouter: APIRouter {
    case getWeatherForCity(id: String)
    case getWeatherForSeveralDays(cityId: String)
    
    var method: HTTPMethod {
        switch self {
        case .getWeatherForCity, .getWeatherForSeveralDays:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getWeatherForCity(let id):
            return "weather?id=\(id)&appid=\(kAppId)"
        case .getWeatherForSeveralDays(let id):
            return "forecast?id=\(id)&appid=\(kAppId)"
        }
    }
    
    var parameters: Parameters? {
        return nil
    }
}
