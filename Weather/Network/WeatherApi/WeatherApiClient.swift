//
//  WeatherApiClient.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 08.08.2022.
//

protocol WeatherApiClienttProtocol {
    func getWeatherCityById(id: String, completion: @escaping (Result<WeatherModel, Error>) -> Void)
    func getWeatherCitySeveralDays(id: String, completion: @escaping (Result<WeatherCityDetailsModel, Error>) -> Void)
}

struct WeatherApiClient: WeatherApiClienttProtocol {
    func getWeatherCityById(id: String, completion: @escaping (Result<WeatherModel, Error>) -> Void) {
        let route = WeatherApiRouter.getWeatherForCity(id: id)
        APIClient.performRequest(route: route, completion: completion)
    }
    
    func getWeatherCitySeveralDays(id: String, completion: @escaping (Result<WeatherCityDetailsModel, Error>) -> Void) {
        let route = WeatherApiRouter.getWeatherForSeveralDays(cityId: id)
        APIClient.performRequest(route: route, completion: completion)
    }
    

}
