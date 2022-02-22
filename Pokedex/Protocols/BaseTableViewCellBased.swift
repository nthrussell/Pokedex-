//
//  BaseTableViewCellBased.swift
//  Pokedex
//
//  Created by M A Russel on 13/9/21.
//

import Foundation

protocol BaseTableViewCellBased {
    associatedtype ViewModel
    func configureWith(data: ViewModel)
}
