//
//  NetworkError.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 08.08.2022.
//


import Foundation

enum ResponseStatus: String, Decodable {
    case success
    case error = "err"
}

struct NetworkError: LocalizedError, Decodable {
    let status: ResponseStatus
    let message: String?
    
    var errorDescription: String? {
        return message
    }
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
    }
    
    enum NetworkErrorDecodingError: Error {
        case wrongStatus
    }
}

extension NetworkError {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let status = try container.decode(ResponseStatus.self, forKey: .status)
        if status == .success {
            throw NetworkErrorDecodingError.wrongStatus
        }
        self.status = status
        self.message = try container.decodeIfPresent(String.self, forKey: .message)
    }
}
