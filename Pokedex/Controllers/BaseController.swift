//
//  BaseController.swift
//  Pokedex
//
//  Created by M A Russel on 13/9/21.
//

import UIKit

protocol BaseController: LocalizationBased {
    func `deinit`()
    
    func didLoad()
    
    func willAppear()
    func didAppear()
    
    func willDisappear()
    func didDisappear()
}

extension BaseController where Self: UIViewController {
    func `deinit`() {
        NotificationCenter.default.removeObserver(self)
    }
    
    func didLoad() {
        setNeedsStatusBarAppearanceUpdate()
        view.backgroundColor = .white
        assignLocalizedTexts()
    }
    
    func willAppear() { }
    func didAppear() { }
    
    func willDisappear() { }
    func didDisappear() { }
}
