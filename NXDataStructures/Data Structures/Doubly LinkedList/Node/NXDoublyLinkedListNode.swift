//
//  NXDoublyLinkedListNode.swift
//  NXDataStructures
//
//  Created by Tino Krželj on 25/02/2019.
//  Copyright © 2019 Tino Krželj. All rights reserved.
//

import Foundation

public class NXDoublyLinkedListNode<T> {
    //
    // MARK: Properties
    //
    
    public var associatedValue: T?
    public var nextNode: NXDoublyLinkedListNode?
    public var previousNode: NXDoublyLinkedListNode?
    
    //
    // MARK: Initializers
    //
    
    init(associatedValue: T?, nextNode next: NXDoublyLinkedListNode? = nil, previousNode previous: NXDoublyLinkedListNode? = nil) {
        self.associatedValue = associatedValue
        self.nextNode = next
        self.previousNode = previous
    }
}

//
//  MARK: - Extension - CustomStringConvertible
//

extension NXDoublyLinkedListNode: CustomStringConvertible {
    public var description: String {
        return String(describing: self.associatedValue)
    }
}
