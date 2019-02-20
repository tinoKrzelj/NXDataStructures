//
//  NXLinkedListNode.swift
//  NXDataStructures
//
//  Created by Tino Krželj on 18/02/2019.
//  Copyright © 2019 Tino Krželj. All rights reserved.
//

import Foundation

public class NXLinkedListNode<T> {
    //
    // MARK: Properties
    //
    
    public var associatedValue: T?
    public var nextNode: NXLinkedListNode?
    
    //
    // MARK: Initializers
    //
    
    init(associatedValue: T?, nextNode node: NXLinkedListNode? = nil) {
        self.associatedValue = associatedValue
        self.nextNode = node
    }
}

//
//  MARK: - Extension - CustomStringConvertible
//

extension NXLinkedListNode: CustomStringConvertible {
    public var description: String {
        return String(describing: self.associatedValue)
    }
}
