//
//  NXTree.swift
//  NXDataStructures
//
//  Created by Tino Krželj on 03/03/2019.
//  Copyright © 2019 Tino Krželj. All rights reserved.
//

import Foundation

public struct NXTree<T: Equatable> {
    //
    // MARK: Properties
    //
    
    private var rootTreeNode: NXTreeNode<T>?
    
    /// Will return root node or nil if tree is empty
    public var root: NXTreeNode<T>? {
        return rootTreeNode
    }
    
    //
    // MARK: Inits
    //
    
    init(withRootNode node: NXTreeNode<T>) {
        rootTreeNode = node
    }
    
    //
    // MARK: Methods
    //
    
    /// Will return is tree empty or not
    public func empty() -> Bool {
        return rootTreeNode == nil
    }
    
    /// Will empty the tree
    public mutating func removeAll() {
        rootTreeNode = nil
    }
    
    /*
     Will add the newNode as the child of the root node (if the root node is nill then child will be setted as the root node).
     
     - parameters:
        - newChild: Node that will be added as a child
     **/
    public mutating func addChildToTheRootNode(newChild child: NXTreeNode<T>) {
        guard !empty() else {
            rootTreeNode = child
            return
        }
        rootTreeNode?.children.append(child)
    }
    
    /// Will perform depth-first traversal (starting with the root it will visit nodes as deep as it can before backtracking)
    public func performDepthFirstTraversalFromRoot(andPerformClosure closure: (NXTreeNode<T>) -> Void) {
        guard !empty() else { return }
        rootTreeNode?.performDepthFirstTraversal(andPerformClosure: closure)
    }
    
    /// Will perform level-order traversal (it will visit each node of the tree based on the depth of the node)
    public func performLevelOrderTraversalFromRoot(andPerformClosure closure: (NXTreeNode<T>) -> Void) {
        guard !empty() else { return }
        rootTreeNode?.performLevelOrderTraversal(andPerformClosure: closure)
    }
    
    /**
     Will perform level order search and return searched node (if found).
     
     - parameters:
        - searchValue: Value that will be searched for in tree
     */
    public func performLevelOrderSearchFromRoot(searchValue value: T) -> NXTreeNode<T>? {
        return rootTreeNode?.performLevelOrderSearch(searchValue: value)
    }
    
}
