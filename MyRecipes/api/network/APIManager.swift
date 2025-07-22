//
//  APIManager.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 22/07/25.
//

import Foundation

protocol APIManagerProtocol: AnyObject {
    func perform(_ request: RequestProtocol, host: APIConstants) async throws -> Data
}


final class APIManager: APIManagerProtocol {
    
    private var urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func perform(_ request: any RequestProtocol, host: APIConstants) async throws -> Data {
        let (data, response) = try await urlSession.data(for: request.createURLRequest(host: host))
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else { throw NetworkError.invalidServerResponse }
        
        return data
    }
}
