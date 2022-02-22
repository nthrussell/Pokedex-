//
//  Logger.swift
//  Pokedex
//
//  Created by M A Russel on 13/9/21.
//

import Foundation

final class Logger {
    static func log(_ text: String) {
        #if DEBUG
        print(text)
        #endif
    }
    
    static func log(_ objects: Any...) {
        #if DEBUG
        objects.forEach({ print($0) })
        #endif
    }
    
    private init() { }
}
