//
//  APIClient.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 08.08.2022.
//

import Alamofire

class APIClient {
    @discardableResult
    static func performRequest<T: Decodable>(route: APIRouter,
                                             decoder: JSONDecoder = JSONDecoder(),
                                             completion: @escaping (Result<T,Error>) -> Void) -> DataRequest {
        return AF.upload( multipartFormData: { multipartFormData in
            for (key, value) in route.getParameters() {
                if let temp = value as? String {
                    
                    multipartFormData.append(temp.data(using: .utf8)!, withName: key)
                }
                
                if let temp = value as? [String: Any] {
                    guard let data = try? JSONSerialization.data(withJSONObject: temp, options: []) else {
                        return
                    }
                    
                    multipartFormData.append(data, withName: key)
                }
                
                if let temp = value as? [Any] {
                    guard let data = try? JSONSerialization.data(withJSONObject: temp, options: []) else {
                        return
                    }
                    
                    multipartFormData.append(data, withName: key)
                }
                
                if let temp = value as? Int {
                    multipartFormData.append("\(temp)".data(using: .utf8)!, withName: key)
                }
                
                if let temp = value as? Float {
                    multipartFormData.append(temp.description.data(using: .utf8)!, withName: key)
                }
            }
        }, with: route).responseDecodable(decoder: decoder) { (response: DataResponse<T, AFError>) in
            if let data = response.data {
                let json = String(data: data, encoding: String.Encoding.utf8)
                print("Response: \(json ?? "undecoded response")")
            }
            if let data = response.data,
               let networkError = try? decoder.decode(NetworkError.self, from: data) {
                print(networkError)
                completion(.failure(networkError))
                return
            }
            
            switch response.result {
            case .success(let model):
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error as Error))
            }
        }
    }
}
