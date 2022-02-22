//
//  ViewBased.swift
//  Pokedex
//
//  Created by M A Russel on 13/9/21.
//

import UIKit

protocol ViewBased {
    associatedtype View: UIView
    var rootView: View { get }
}
