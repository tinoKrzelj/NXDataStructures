//
//  NXStack.swift
//  NXDataStructures
//
//  Created by Tino Krželj on 26/10/2018.
//  Copyright © 2018 Tino Krželj. All rights reserved.
//

import Foundation

public struct NXStack<T: Comparable> {
    
    //
    //  MARK: Properties
    //
    
    /// This represents stack.
    private lazy var allocatedSpace = [T]()
    
    //
    //  MARK: Custom Methods
    //
    
    /**
     Pushes element on the top of the stack.
     
     - parameters:
        - element: Represent the element that will be pushed
     */
    mutating public func push(_ element: T) {
        allocatedSpace.append(element)
    }
    
    /**
     Pushes element at the specific index within the stack.
     If index is < 0 or > stack.count() then element will be pushed on the top.
     
     - parameters:
        - element: Represent the element that will be pushed
        - atIndex: Represents the index where element will be pushed
     */
    mutating public func push(_ element: T, atIndex index: Int) {
        guard index >= 0, index < allocatedSpace.count  else {
            push(element)
            return
        }
        allocatedSpace.insert(element, at: index)
    }
    
    /// Pops the element on the top.
    @discardableResult
    mutating public func pop() -> T? {
        guard !allocatedSpace.isEmpty else { return nil }
        return allocatedSpace.removeLast()
    }
    
    /**
     Pops the element from the specific index.
    
     - parameters:
     - atIndex: Represents the index of the element that will be poped
     */
    @discardableResult
    mutating public func pop(atIndex index: Int) -> T? {
        guard !allocatedSpace.isEmpty, index >= 0, index < allocatedSpace.count else { return nil }
        return allocatedSpace.remove(at: index)
    }
    
    /// Pops all elements.
    mutating public func clearStack() {
        guard !allocatedSpace.isEmpty else { return }
        allocatedSpace.removeAll()
    }

    /// Peeks the element on the top. Element won't be removed from Stack.
    mutating public func peek() -> T? {
        guard !allocatedSpace.isEmpty else { return nil }
        return allocatedSpace.last
    }
    
    /**
     Peeks the element at specific index. Element won't be removed from Stack.
     
     - parameters:
        - atIndex: Represents the index of the element that we will peek at
     */
    mutating public func peek(atIndex index: Int) -> T? {
        guard !allocatedSpace.isEmpty, index >= 0, index < allocatedSpace.count else { return nil }
        return allocatedSpace[index]
    }
    
    /**
     Moves specific element (if found in stack) at specific index.
     Be aware if you have two same elements only the first one will be moved.
     
     - parameters:
        - element: Represents element that should be moved (if found)
        - atIndex: Represents new index where element should be placed
     */
    mutating public func move(element el: T, atIndex index: Int) {
        guard !allocatedSpace.isEmpty, index >= 0, index < allocatedSpace.count  else { return }
        guard let oldIndex = indexOfElement(element: el) else { return }
        pop(atIndex: oldIndex)
        push(el, atIndex: index)
    }
    
    /**
     Moves specific element from provided index (if found in stack) at specific new index.
     Be aware if you have two same elements only the first one will be moved.
     
     - parameters:
        - elementAtIndex: Represents index of an element that should be moved (if found)
        - atIndex: Represents new index where element should be placed
     */
    mutating public func move(elementAtIndex index1: Int, atIndex index2: Int) {
        guard !allocatedSpace.isEmpty, index1 >= 0, index1 < allocatedSpace.count, index2 >= 0, index2 < allocatedSpace.count  else { return }
        guard let element = pop(atIndex: index1) else { return }
        push(element, atIndex: index2)
    }
    
    /**
     Return wheather provided elemenet is in the stack or not.
     
     - parameters:
        - element: Represents element that we will be searching for
     */
    mutating public func contains(_ element: T) -> Bool {
        guard !allocatedSpace.isEmpty else { return false }
        return allocatedSpace.contains { return $0 == element }
    }
    
    /**
     Return index of provided element (if found).
     
     - parameters:
        - element: Represents element that we will be searching the index for
     */
    mutating public func indexOfElement(element el: T) -> Int? {
        guard !allocatedSpace.isEmpty else { return nil }
        guard let index = allocatedSpace.firstIndex(of: el) else { return nil }
        return index
    }
    
    /// Returns complete stack.
    mutating public func currentStack() -> [T] {
        return allocatedSpace
    }
    
    /// Debug method - Prints out complete stack to the console in a formated way.
    mutating public func printStack() {
        NXLog.log(message: "\(allocatedSpace)", withTag: "Stack")
    }
    
    /// Returns number of elements in stack.
    mutating func count() -> Int {
        return allocatedSpace.count
    }
}
