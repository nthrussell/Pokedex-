//
//  BoundView.swift
//  Pokedex
//
//  Created by M A Russel on 13/9/21.
//

import UIKit

class BoundView<ViewModel>: BaseView, ViewModelBased {
    var viewModel: ViewModel
    
    required init?(coder: NSCoder) {
        fatalError("Use .init(with:) instead")
    }
    
    private override init(frame: CGRect) {
        fatalError("Use .init(with:) instead")
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    init(with viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        setupViews()
        setupLayouts()
    }
}
