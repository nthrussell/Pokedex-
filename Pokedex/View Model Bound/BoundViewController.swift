//
//  BoundViewController.swift
//  Pokedex
//
//  Created by M A Russel on 13/9/21.
//

import UIKit

class BoundViewController<View: UIView, ViewModel>: BaseViewController, ViewBased, ViewModelBased {
    let rootView: View
    let viewModel: ViewModel
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Use .init(with:) instead")
    }
    
    private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("Use .init(with:) instead")
    }
    
    init(with view: View, and viewModel: ViewModel) {
        rootView = view
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = rootView
    }
}
