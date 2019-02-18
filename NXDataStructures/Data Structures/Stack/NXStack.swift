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
    //  MARK: - Properties
    //
    
    private lazy var allocatedSpace = [T]()
    
    //
    //  MARK: - Custom methods
    //
    
    mutating public func push(_ element: T) {
        allocatedSpace.append(element)
    }
    
    mutating public func push(_ element: T, atIndex index: Int) {
        guard index >= 0, index < allocatedSpace.count  else { return }
        allocatedSpace.insert(element, at: index)
    }
    
    mutating public func pop() -> T? {
        guard !allocatedSpace.isEmpty else { return nil }
        return allocatedSpace.removeLast()
    }
    
    mutating public func pop(atIndex index: Int) -> T? {
        guard !allocatedSpace.isEmpty, index >= 0, index < allocatedSpace.count  else { return nil }
        return allocatedSpace.remove(at: index)
    }
    
    mutating public func popAll() {
        guard !allocatedSpace.isEmpty else { return }
        allocatedSpace.removeAll()
    }
    
    mutating public func peek() -> T? {
        guard !allocatedSpace.isEmpty else { return nil }
        return allocatedSpace.last
    }
    
    mutating public func peek(atIndex index: Int) -> T? {
        guard !allocatedSpace.isEmpty, index >= 0, index < allocatedSpace.count  else { return nil }
        return allocatedSpace[index]
    }
    
    mutating public func move(element el: T, atIndex index: Int) {
        guard !allocatedSpace.isEmpty, index >= 0, index < allocatedSpace.count  else { return }
        guard allocatedSpace.contains(el) else { return }
        for oldIndex in allocatedSpace.indices where allocatedSpace[oldIndex] == el {
            _ = pop(atIndex: oldIndex)
            push(el, atIndex: index)
            break
        }
    }
    
    mutating public func move(elementAtIndex index1: Int, atIndex index2: Int) {
        guard !allocatedSpace.isEmpty, index1 >= 0, index1 < allocatedSpace.count, index2 >= 0, index2 < allocatedSpace.count  else { return }
        guard let element = pop(atIndex: index1) else { return }
        allocatedSpace.insert(element, at: index2)
    }
    
    mutating public func contains(_ element: T) -> Bool {
        guard !allocatedSpace.isEmpty else { return false }
        return allocatedSpace.contains { return $0 == element }
    }
    
    mutating public func currentStack() -> [T] {
        return allocatedSpace
    }
    
    mutating public func printStack() {
        #if DEBUG
            print("Stack -> ", allocatedSpace)
        #endif
    }
    
    mutating func count() -> Int {
        return allocatedSpace.count
    }
}
