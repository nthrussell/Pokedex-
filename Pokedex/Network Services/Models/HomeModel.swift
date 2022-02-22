//
//  HomeModel.swift
//  Pokedex
//
//  Created by M A Russel on 13/9/21.
//

import Foundation

struct HomeModel: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [PokeDetail]
}

struct PokeDetail: Codable {
    let name: String
    let url: String
}
