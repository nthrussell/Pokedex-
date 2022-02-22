//
//  PokemonDetailModel.swift
//  Pokedex
//
//  Created by M A Russel on 14/9/21.
//

import Foundation

struct PokemonDetailModel: Codable {
    let id: Int
    let height: Int
    let sprites: Sprites
    let weight: Int
}

class Sprites: Codable {
    let front_default: URL?
}
