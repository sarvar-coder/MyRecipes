//
//  RequestManager.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 22/07/25.
//

import Foundation

protocol RequestManagerProtocol: AnyObject {
    func perform<T: Decodable>(_ request: RequestProtocol, host: APIConstants) async throws -> T
}


class RequestManager: RequestManagerProtocol {
    
    private let apiManager: APIManagerProtocol
    private let dataParser: DataParserProtocol
    
    init(apiManager: APIManagerProtocol = APIManager(),
         dataParser: DataParserProtocol = DataParser()) {
        self.apiManager = apiManager
        self.dataParser = dataParser
    }
    
    func perform<T>(_ request: any RequestProtocol, host: APIConstants) async throws -> T where T : Decodable {
        
        let data = try await apiManager.perform(request, host: host)
        
        let decoded: T = try dataParser.parse(data: data)
        
        return decoded
    }
}
