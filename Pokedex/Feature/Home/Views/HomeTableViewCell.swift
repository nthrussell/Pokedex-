//
//  HomeTableViewCell.swift
//  Pokedex
//
//  Created by M A Russel on 13/9/21.
//

import Foundation

final class HomeTableViewCell: BoundTableViewCell<PokeCellViewModel> {
    static let identifier = "\(HomeTableViewCell.self)"

    override func setupViews() {
        super.setupViews()
    }
    
    override func setupLayouts() {
        super.setupLayouts()
    }
    
    override func configureWith(data: PokeCellViewModel) {
        super.configureWith(data: data)
        textLabel?.text = data.data.name
    }
}
