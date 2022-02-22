//
//  Constants.swift
//  Pokedex
//
//  Created by M A Russel on 13/9/21.
//

import Foundation

struct Constants {
    struct URLs {
        static let baseURL = URL(string: "https://pokeapi.co")!
        private init() { }
    }
}

extension Constants {
    struct NotificationNames {
        static let appUpdatedLanguage = Notification.Name(rawValue: "App-Updated-Language")
        private init() { }
    }
}
