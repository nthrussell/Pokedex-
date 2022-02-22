//
//  PokeDetailViewModel.swift
//  Pokedex
//
//  Created by M A Russel on 14/9/21.
//

import Foundation

protocol PokeDetailViewModel: AnyObject {
    var apiService: HomeApiSevice { get }
    var name: String { get }
    func getPokeDetails(with name: String, onCompletion completionHandler: ((Result<PokemonDetailModel, Error>) -> Void)?)
}

final class DefaultPokeDetailViewModel: PokeDetailViewModel {
    var apiService: HomeApiSevice
    var name: String
    
    init(with apiService: HomeApiSevice, and name: String) {
        self.apiService = apiService
        self.name = name
    }
    
    func getPokeDetails(with name: String, onCompletion completionHandler: ((Result<PokemonDetailModel, Error>) -> Void)?) {
        apiService.getPokeDetail(name: name) { result in
            switch result {
            case let .success(payload):
                completionHandler?(.success(payload))
            case let .failure(error):
                completionHandler?(.failure(error))
            }
        }
    }

}
