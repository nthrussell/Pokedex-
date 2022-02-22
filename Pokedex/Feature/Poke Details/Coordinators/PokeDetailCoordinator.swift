//
//  PokeDetailCoordinator.swift
//  Pokedex
//
//  Created by M A Russel on 14/9/21.
//

import UIKit

final class PokeDetailCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    private(set) var navigationController: UINavigationController?
    private var name: String
    
    init(with navigationController: UINavigationController, and name: String) {
        self.navigationController = navigationController
        self.name = name
    }
    
    func start() {
        let viewModel = DefaultPokeDetailViewModel(with: DefaultHomeApiService(), and: name)
        let view = PokeDetailView(with: viewModel)
        let viewController = PokeDetailViewController(with: view, and: viewModel)
        viewController.coordinator = self
        
        viewController.modalPresentationStyle = .overCurrentContext
        viewController.coordinator = self
        navigationController?.topViewController?.present(viewController, animated: false, completion: nil)
    }
    
    func dissmiss() {
        navigationController?.topViewController?.dismiss(animated: false, completion: nil)
    }
}
