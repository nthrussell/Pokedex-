//
//  BaseTableViewCell.swift
//  Pokedex
//
//  Created by M A Russel on 13/9/21.
//

import UIKit

class BaseTableViewCell: UITableViewCell, ViewFlow {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
