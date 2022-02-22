//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by M A Russel on 13/9/21.
//

import Foundation

protocol HomeViewModel: AnyObject {
    var apiService: HomeApiSevice { get }
    func numberOfRows(in section: Int) -> Int?
    func itemAt(section: Int, index: Int) -> PokeCellViewModel?
    func getPokeList(onCompletion completionHandler: ((Swift.Result<HomeModel, Error>) -> Void)?)
}

final class DefaultHomeViewModel: HomeViewModel {
    let apiService: HomeApiSevice
    
    var pokeData: [PokeDetail]? {
        didSet {
            guard let pokeData = pokeData else { return }
            pokeCellViewModels = pokeData.map({ DefaultPokeCellViewModel(data: $0) })
        }
    }
    
    var pokeCellViewModels: [PokeCellViewModel]?
    
    init(with apiService: HomeApiSevice) {
        self.apiService = apiService
    }
    
    func numberOfRows(in section: Int) -> Int? {
        return pokeData?.count
    }
    
    func itemAt(section: Int, index: Int) -> PokeCellViewModel? {
        return pokeCellViewModels?[index]
    }
    
    func getPokeList(onCompletion completionHandler: ((Swift.Result<HomeModel, Error>) -> Void)?) {
        apiService.getPokeList(numberOfElements: 20) { [weak self] (result) in
            switch result {
            case let .success(payload):
                if self?.pokeData == nil { self?.pokeData = [] }
                self?.pokeData?.append(contentsOf: payload.results)
                
            case let .failure(error):
                Logger.log(error.localizedDescription)
            }
            completionHandler?(result)
        }
    }
}


protocol PokeCellViewModel {
    var data: PokeDetail { get }
}

final class DefaultPokeCellViewModel: PokeCellViewModel {
    let data: PokeDetail
    
    init(data: PokeDetail) {
        self.data = data
    }
}
