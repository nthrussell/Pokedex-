//
//  ViewModelBased.swift
//  Pokedex
//
//  Created by M A Russel on 13/9/21.
//

protocol ViewModelBased: AnyObject {
    associatedtype ViewModel
    var viewModel: ViewModel { get }
}
