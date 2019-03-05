//
//  NXTreeNode.swift
//  NXDataStructures
//
//  Created by Tino Krželj on 03/03/2019.
//  Copyright © 2019 Tino Krželj. All rights reserved.
//

import Foundation

//    Other data structures used:
//        - NXQueue

public final class NXTreeNode<T: Equatable> {
    //
    // MARK: Properties
    //
    
    public var associatedValue: T?
    public lazy var children = [NXTreeNode]()
    
    //
    // MARK: Inits
    //
    
    init(withValue value: T?) {
        associatedValue = value
    }
    
    //
    // MARK: Methods
    //
    
    /**
     Will add new child to the current node
     
     - parameters:
        - child: Child that will be added to the current node
     */
    public func add(newChild child: NXTreeNode) {
        children.append(child)
    }
    
    /// Will perform depth-first traversal (starting with the current node it will visit nodes as deep as it can before backtracking)
    public func performDepthFirstTraversal(andPerformClosure closure: (NXTreeNode) -> Void) {
        closure(self)
        children.forEach { $0.performDepthFirstTraversal(andPerformClosure: closure) }
    }
    
    /// Will perform level-order traversal (it will visit each node of the tree based on the depth of the node)
    public func performLevelOrderTraversal(andPerformClosure closure: (NXTreeNode) -> Void) {
        closure(self)
        var tmpQueue = NXQueue<NXTreeNode>()
        children.forEach { tmpQueue.enqueue(newElement: $0) }
        while let loopNode = tmpQueue.dequeue() {
            closure(loopNode)
            loopNode.children.forEach { tmpQueue.enqueue(newElement: $0) }
        }
    }
    
    /**
     Will perform level order search and return searched node (if found).
     
     - parameters:
        - searchValue: Value that will be searched for in tree
     */
    public func performLevelOrderSearch(searchValue value: T) -> NXTreeNode<T>? {
        var tmpQueue = NXQueue<NXTreeNode>()
        children.forEach { tmpQueue.enqueue(newElement: $0) }
        while let loopNode = tmpQueue.dequeue() {
            if loopNode.associatedValue == value { return loopNode }
            loopNode.children.forEach { tmpQueue.enqueue(newElement: $0) }
        }
        return nil
    }
    
}
