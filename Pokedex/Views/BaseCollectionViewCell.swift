//
//  BaseCollectionViewCell.swift
//  Pokedex
//
//  Created by M A Russel on 13/9/21.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell, ViewFlow {
    init() {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
        assignLocalizedTexts()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayouts()
        assignLocalizedTexts()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() { }
    
    func setupLayouts() { }
    
    func assignLocalizedTexts() { }
}
