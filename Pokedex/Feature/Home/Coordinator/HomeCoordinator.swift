//
//  HomeCoordinator.swift
//  Pokedex
//
//  Created by M A Russel on 13/9/21.
//

import UIKit

final class HomeCoordinator: Coordinator {
    private(set) lazy var childCoordinators: [Coordinator] = []
    
    let viewController: UIViewController
    let navigationController: BaseNavigationController = .init()

    private weak var window: UIWindow?
    
    init(with window: UIWindow?) {
        self.window = window
        
        let viewModel = DefaultHomeViewModel(with: DefaultHomeApiService())
        let view = HomeView(with: viewModel)
        let viewController = homeViewController(with: view, and: viewModel)
        self.viewController = viewController
        viewController.coordinator = self

        navigationController.setViewControllers([self.viewController], animated: true)
        navigationController.navigationBar.prefersLargeTitles = true

    }
    
    func start() {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func navigateToDetails(with name: String) {
        childCoordinators.removeAll()
        childCoordinators.append(PokeDetailCoordinator(with: navigationController, and: name))
        childCoordinators.first?.start()
    }
}
