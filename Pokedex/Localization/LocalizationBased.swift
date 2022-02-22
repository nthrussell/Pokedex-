//
//  LocalizationBased.swift
//  Pokedex
//
//  Created by M A Russel on 13/9/21.
//

import UIKit

protocol LocalizationBased {
    func assignLocalizedTexts()
    func setupLocalizationObservers()
}

extension LocalizationBased where Self: UIView {
    func setupLocalizationObservers() {
        NotificationCenter.default.addObserver(
            forName: Constants.NotificationNames.appUpdatedLanguage,
            object: nil,
            queue: .main,
            using: { [weak self] (_) in
                self?.assignLocalizedTexts()
            })
    }
}

extension LocalizationBased where Self: UIViewController {
    func setupLocalizationObservers() {
        NotificationCenter.default.addObserver(
            forName: Constants.NotificationNames.appUpdatedLanguage,
            object: nil,
            queue: .main,
            using: { [weak self] (_) in
                self?.assignLocalizedTexts()
            })
    }
}
