//
//  BaseViewController.swift
//  Pokedex
//
//  Created by M A Russel on 13/9/21.
//

import UIKit

class BaseViewController: UIViewController, BaseController {
    override var preferredStatusBarStyle: UIStatusBarStyle { .default }
    
    deinit { `deinit`() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didLoad()
        setupLocalizationObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        willAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        didAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        willDisappear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        didDisappear()
    }
    
    func assignLocalizedTexts() { }
}
