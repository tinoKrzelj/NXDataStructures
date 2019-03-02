//
//  NXDoublyLinkedList.swift
//  NXDataStructures
//
//  Created by Tino Krželj on 25/02/2019.
//  Copyright © 2019 Tino Krželj. All rights reserved.
//

import Foundation

public struct NXDoublyLinkedList<T> {
    //
    //  MARK: - Properties
    //
    
    var head: NXDoublyLinkedListNode<T>?
    var tail: NXDoublyLinkedListNode<T>?

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
        let newNode = NXDoublyLinkedListNode(associatedValue: value, nextNode: head)
        head?.previousNode = newNode
        head = newNode
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
        tail?.nextNode = NXDoublyLinkedListNode(associatedValue: value, previousNode: tail)
        tail = tail?.nextNode
    }
    
    /**
     Will add the new node with value after the provided node.
     - parameters:
        - node: Represents the node that will be used to set the new node after it
        - withValue: Represents the value that will be used in creation of the new node
     */
    public mutating func addNodeAfter(node: NXDoublyLinkedListNode<T>, withValue value: T) {
        guard tail !== node else {
            addNodeAtEnd(withValue: value)
            return
        }
        let newNode = NXDoublyLinkedListNode(associatedValue: value, nextNode: node.nextNode, previousNode: node)
        node.nextNode?.previousNode = newNode
        node.nextNode = newNode
    }
    
    /**
     Will add the new node with value before the provided node.
     - parameters:
        - node: Represents the node that will be used to set the new node before it
        - withValue: Represents the value that will be used in creation of the new node
     */
    public mutating func addNodeBefore(node: NXDoublyLinkedListNode<T>, withValue value: T) {
        guard head !== node else {
            addNodeAtBegining(withValue: value)
            return
        }
        let newNode = NXDoublyLinkedListNode(associatedValue: value, nextNode: node, previousNode: node.previousNode)
        node.previousNode?.nextNode = newNode
        node.previousNode = newNode
    }

    /**
     Returns the node on specific index (if found).
     - parameters:
        - adIndex: Will be used for getting node at that index
     */
    public mutating func node(atIndex index: Int) -> NXDoublyLinkedListNode<T>? {
        var loopNode = head
        var loopIndex = 0
        while loopNode != nil && loopIndex < index {
            loopNode = loopNode?.nextNode
            loopIndex += 1
        }
        return loopNode
    }
    
    /// Debug method - Prints complete linked list to the console.
    public mutating func printDoublyLinkedList() {
        var loopNode = head
        NXLog.log(message: "Doubly linked list => ")
        while loopNode != nil {
            NXLog.log(message: loopNode?.description ?? "unknown")
            loopNode = loopNode?.nextNode
        }
    }
    
    /// Debug method - Prints complete linked list in reversed order to the console.
    public mutating func printReversedDoublyLinkedList() {
        var loopNode = tail
        NXLog.log(message: "Doubly linked list => ")
        while loopNode != nil {
            NXLog.log(message: loopNode?.description ?? "unknown")
            loopNode = loopNode?.previousNode
        }
    }
    
    /// Will remove first node from the linked list.
    @discardableResult
    public mutating func removeFirst() -> NXDoublyLinkedListNode<T>? {
        guard !empty() else { return nil }
        let currentHead = head
        head = head?.nextNode
        head?.previousNode = nil
        if empty() { tail = nil }
        return currentHead
    }
    
    /// Will remove last node from the linked list.
    @discardableResult
    public mutating func removeLast() -> NXDoublyLinkedListNode<T>? {
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
    
    /// Will remove node afther provided node
    @discardableResult
    public mutating func removeAfter(node: NXDoublyLinkedListNode<T>) -> NXDoublyLinkedListNode<T>? {
        guard !empty() else { return nil }
        guard node.nextNode !== tail else {
            let currentLast = tail
            node.previousNode = tail?.previousNode?.previousNode
            tail = node
            return currentLast
        }
        let currentLast = node.nextNode
        node.nextNode?.nextNode?.previousNode = node
        node.nextNode = node.nextNode?.nextNode
        return currentLast
    }
    
    /// Will remove node before provided node
    @discardableResult
    public mutating func removeBefore(node: NXDoublyLinkedListNode<T>) -> NXDoublyLinkedListNode<T>? {
        guard !empty() else { return nil }
        guard node.previousNode !== head else {
            let currentPrevious = head
            node.previousNode = nil
            head = node
            return currentPrevious
        }
        let currentPrevious = node.previousNode
        node.previousNode?.previousNode?.nextNode = node
        node.previousNode = node.previousNode?.previousNode
        return currentPrevious
    }
    
    /// Will peek at first node in doubly linked list
    public mutating func peekFirst() -> NXDoublyLinkedListNode<T>? {
        return head
    }
    
    /// Will peek at last node in doubly linked list
    public mutating func peekLast() -> NXDoublyLinkedListNode<T>? {
        return tail
    }
}
