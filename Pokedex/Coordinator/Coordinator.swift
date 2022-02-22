//
//  Coordinator.swift
//  Pokedex
//
//  Created by M A Russel on 13/9/21.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get }
    func start()
}
