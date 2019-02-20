//
//  NXLinkedList.swift
//  NXDataStructures
//
//  Created by Tino Krželj on 15/02/2019.
//  Copyright © 2019 Tino Krželj. All rights reserved.
//

import Foundation

public struct NXLinkedList<T> {
    //
    //  MARK: - Properties
    //
    
    var head: NXLinkedListNode<T>?
    var tail: NXLinkedListNode<T>?
    
    //
    // MARK: Custom methods
    //
    
    /// Returns true if linked list contains at least one elment.
    public func empty() -> Bool {
        return head == nil
    }
    
    /**
     Adds node with value at the begining of the linked list.
     
     - parameters:
        - withValue: Value which will be used as a associated value when creating a new node.
     */
    public mutating func addNodeAtBegining(withValue value: T) {
        head = NXLinkedListNode(associatedValue: value, nextNode: head)
        guard tail == nil else { return }
        tail = head
    }
    
    /**
     Adds node with value at the end of the linked list.
     
     - parameters:
        - withValue: Value which will be used as a associated value when creating a new node.
     */
    public mutating func addNodeAtEnd(withValue value: T) {
        guard !empty() else {
            addNodeAtBegining(withValue: value)
            return
        }
        tail?.nextNode = NXLinkedListNode(associatedValue: value)
        tail = tail?.nextNode
    }
    
    /**
     Will add the new node with value after the provided node.
     - parameters:
        - node: Represents the node that will be used to set the new node after it
        - withValue: Represents the value that will be used in creation of the new node
     */
    public mutating func addNoteAfter(node: NXLinkedListNode<T>, withValue value: T) {
        guard tail !== node else {
            addNodeAtEnd(withValue: value)
            return
        }
        node.nextNode = NXLinkedListNode(associatedValue: value)
    }
    
    /**
     Returns the node on specific index (if found).
     - parameters:
        - adIndex: Will be used for getting node at that index
     */
    public mutating func node(atIndex index: Int) -> NXLinkedListNode<T>? {
        var loopNode = head
        var loopIndex = 0
        while loopNode != nil && loopIndex < index {
            loopNode = loopNode?.nextNode
            loopIndex += 1
        }
        return loopNode
    }
    
    /// Debug method - Prints complete linked list to the console.
    public mutating func printLinkedList() {
        var loopNode = head
        NXLog.log(message: "Linked list => ")
        while loopNode != nil {
            NXLog.log(message: loopNode?.description ?? "unknown")
            loopNode = loopNode?.nextNode
        }
    }
    
    /// Will remove first node from the linked list.
    @discardableResult
    public mutating func removeFirst() -> NXLinkedListNode<T>? {
        guard !empty() else { return nil }
        let currentHead = head
        head = head?.nextNode
        if empty() { tail = nil }
        return currentHead
    }
    
    /// Will remove last node from the linked list.
    @discardableResult
    public mutating func removeLast() -> NXLinkedListNode<T>? {
        guard !empty() else { return nil }
        guard head?.nextNode != nil else { return removeFirst() }
        var previous = head
        var current = head
        while let next = current?.nextNode {
            previous = current
            current = next
        }
        previous?.nextNode = nil
        tail = previous
        return current
    }
    
    @discardableResult
    public mutating func removeAfter(node: NXLinkedListNode<T>) -> NXLinkedListNode<T>? {
        guard !empty() else { return nil }
        guard node.nextNode !== tail else {
            let currentLast = tail
            tail = node
            return currentLast
        }
        let currentLast = node.nextNode
        node.nextNode = node.nextNode?.nextNode
        return currentLast
    }
    
}
