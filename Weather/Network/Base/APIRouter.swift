//
//  APIRouter.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 08.08.2022.
//

import Alamofire

protocol APIRouter where Self: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}

extension APIRouter {

    // MARK: - HTTPMethod
    var method: HTTPMethod {
        return .post
    }
    
    // MARK: - Path
    var path: String {
        return ""
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        return nil
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
         let requestString = KNetwork.ProductionServer.baseURL + path
        let url = try requestString.asURL()
        
        var urlRequest = URLRequest(url: url)
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.timeoutInterval = 120
        return urlRequest
    }
    
    func getParameters() -> Parameters {
        self.parameters ?? [:]
    }
}
