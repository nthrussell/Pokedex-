//
//  HomeApiService.swift
//  Pokedex
//
//  Created by M A Russel on 13/9/21.
//

import Alamofire

protocol HomeApiSevice {
    func getPokeList(
        numberOfElements limit: Int,
        onCompletion completionHandler: ((Swift.Result<HomeModel, Error>) -> Void)?
    )
    
    func getPokeDetail(
        name: String,
        onCompletion completionHandler: ((Swift.Result<PokemonDetailModel, Error>) -> Void)?
    )
}

final class DefaultHomeApiService: HomeApiSevice {
    func getPokeList(
        numberOfElements limit: Int,
        onCompletion completionHandler: ((Swift.Result<HomeModel, Error>) -> Void)?
    ) {
        ConnectionManager
            .request(with: HomeRouter.pokeList(limit: limit))
            .responseDecodable(of: HomeModel.self) { response in
                switch response.result {
                case let .success(payload):
                    completionHandler?(.success(payload))
                case let .failure(error):
                    completionHandler?(.failure(error))
                }
        }
    }
    
    func getPokeDetail(
        name: String,
        onCompletion completionHandler: ((Result<PokemonDetailModel, Error>) -> Void)?) {
        ConnectionManager
            .request(with: HomeRouter.pokeDetail(name: name))
            .responseDecodable(of: PokemonDetailModel.self) { response in
                switch response.result {
                case let .success(payload):
                    completionHandler?(.success(payload))
                case let .failure(error):
                    completionHandler?(.failure(error))
                }
        }
    }
}

