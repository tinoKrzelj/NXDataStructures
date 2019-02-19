//
//  NXLog.swift
//  NXDataStructures
//
//  Created by Tino Krželj on 19/02/2019.
//  Copyright © 2019 Tino Krželj. All rights reserved.
//

import Foundation

internal struct NXLog {
    
    //
    // MARK: Custom Methods
    //
    
    /// Logs simple message only if in DEBUG mode
    static func log(message: String) {
        #if DEBUG
            print(message)
        #endif
    }
    
    /// Logs message with tag only if in DEBUG mode
    static func log(message: String, withTag tag: String) {
        #if DEBUG
            print("\(tag) => \(message)")
        #endif
    }
}
