//
//  BaseViewModel.swift
//  Pokedex
//
//  Created by M A Russel on 13/9/21.
//

protocol BaseViewModel {
    associatedtype Services
    init(with services: Services)
}
