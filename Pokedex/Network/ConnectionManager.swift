//
//  ConnectionManager.swift
//  Pokedex
//
//  Created by M A Russel on 13/9/21.
//
import Alamofire

final class ConnectionManager {
    private static let sessionManager: Session = {
        var defaultHeaders = HTTPHeaders.default
        
        let configuration = URLSessionConfiguration.default
        configuration.headers = defaultHeaders
        
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    private init() { }
    
    static func request(with urlRequest: URLRequestConvertible) -> DataRequest {
        let request = sessionManager.request(urlRequest)
        return request.validate()
    }
}

