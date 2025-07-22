//
//  RequestProtocol.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 22/07/25.
//

import Foundation

protocol RequestProtocol {
    var path: String { get }
    
    var headers: [String: String] { get }
    var params: [String: Any] { get }
    
    var urlParams: [String: String?] { get }
    
    var requestType: RequestType { get }
}

// Default values
extension RequestProtocol {
    var params: [String: Any] {
        [:]
    }
    
    var urlParams: [String: String?] {
        [:]
    }
    
    var headers: [String: String] {
        [:]
    }
}


extension RequestProtocol {
    func createURLRequest(host: APIConstants)  throws -> URLRequest {
        
        var companents = URLComponents()
        companents.scheme = "https"
        companents.host = host.rawValue
        companents.path = path
        
        if !urlParams.isEmpty {
            companents.queryItems = urlParams.map {
                URLQueryItem(name: $0, value: $1)
            }
        }
        
        guard let url = companents.url else { throw NetworkError.invalidURL }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue
        
        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if !params.isEmpty {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
        }
        
        return urlRequest
    }
}

