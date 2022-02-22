//
//  HomeViewController.swift
//  Pokedex
//
//  Created by M A Russel on 13/9/21.
//

import UIKit

final class homeViewController: BoundViewController<HomeView, HomeViewModel> {
    weak var coordinator: HomeCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokedex"
        
        getPokeList()
        setupViews()
    }
    
    private func getPokeList() {
        viewModel.getPokeList { [weak self] result in
            switch result {
            case let .success(payload):
                Logger.log("Payload:\(payload)")
                self?.rootView.tableView.reloadData()
            case .failure:
                Logger.log("Table reload failed")
            }
        }
    }
    
    private func setupViews() {
        rootView.onSelectionEvent = { [weak self] name in
            self?.coordinator?.navigateToDetails(with: name)
        }
    }
}
