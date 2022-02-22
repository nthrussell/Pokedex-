//
//  HomeRouter.swift
//  Pokedex
//
//  Created by M A Russel on 13/9/21.
//

import Alamofire

enum HomeRouter: BaseRouter {
    
    case pokeList(limit: Int)
    case pokeDetail(name: String)
    
    var baseURL: URL { Constants.URLs.baseURL }
    
    var commonPathExtension: String { "/api/v2/" }
    
    var path: String {
        switch self {
        case .pokeList:
            return "/pokemon/"
        case let .pokeDetail(name: name):
            return "/pokemon/\(name)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .pokeList, .pokeDetail:
            return .get
        }
    }
    
    var queries: [String : String]? {
        switch self {
        case let .pokeList(limit):
            return ["limit": "\(limit)"]
        case .pokeDetail:
            return nil
        }
    }
    
    var body: Parameters? { nil }
    
    var headers: HTTPHeaders? { nil }
    
    var bodyEncoder: ParameterEncoding? { nil }
}
