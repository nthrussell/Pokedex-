//
//  BaseView.swift
//  Pokedex
//
//  Created by M A Russel on 13/9/21.
//

import UIKit

class BaseView: UIView, ViewFlow {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init() {
        super.init(frame: UIScreen.main.bounds)
        
        runFlow()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        runFlow()
    }
    
    private func runFlow() {
        setupViews()
        setupLayouts()
        setupLocalizationObservers()
        
        assignLocalizedTexts()
    }
    
    func setupViews() { }
    
    func setupLayouts() { }
    
    func assignLocalizedTexts() { }
}
