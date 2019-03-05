//
//  NXTree+Test.swift
//  NXDataStructuresTests
//
//  Created by Tino Krželj on 03/03/2019.
//  Copyright © 2019 Tino Krželj. All rights reserved.
//

import XCTest
@testable import NXDataStructures

class NXTree_Test: XCTestCase {
    //
    // MARK: Properties
    //
    
    private var tree: NXTree<String>?
    
    //
    // MARK: Methods
    //
    
    override func setUp() { }
    override func tearDown() { }
    
    func loadTreeWithTestData() {
        let rootNode = NXTreeNode(withValue: "root")
        let leftNode = NXTreeNode(withValue: "left")
        let rightNode = NXTreeNode(withValue: "right")
        let leftNodeChild1 = NXTreeNode(withValue: "leftChild1")
        let leftNodeChild2 = NXTreeNode(withValue: "leftChild2")
        let rightNodeChild1 = NXTreeNode(withValue: "rightChild1")
        let rightNodeChild2 = NXTreeNode(withValue: "rightChild2")
        rootNode.add(newChild: leftNode)
        rootNode.add(newChild: rightNode)
        leftNode.add(newChild: leftNodeChild1)
        leftNode.add(newChild: leftNodeChild2)
        rightNode.add(newChild: rightNodeChild1)
        rightNode.add(newChild: rightNodeChild2)
        tree = NXTree(withRootNode: rootNode)
    }
    
    func testInit() {
        tree = NXTree(withRootNode: NXTreeNode(withValue: "root"))
        XCTAssertEqual(tree?.root?.associatedValue, "root")
    }
    
    func testEmpty() {
        loadTreeWithTestData()
        XCTAssertEqual(tree?.empty(), false)
        tree?.removeAll()
        XCTAssertEqual(tree?.empty(), true)
    }
    
    func testRemoveAll() {
        loadTreeWithTestData()
        tree?.removeAll()
        XCTAssertEqual(tree?.empty(), true)
    }
    
    func testAddChildToTheRootNode() {
        tree = NXTree(withRootNode: NXTreeNode(withValue: "root"))
        XCTAssertEqual(tree?.root?.children.count, 0)
        tree?.addChildToTheRootNode(newChild: NXTreeNode(withValue: "t1"))
        tree?.addChildToTheRootNode(newChild: NXTreeNode(withValue: "t2"))
        XCTAssertEqual(tree?.root?.children.count, 2)
    }
    
    func testPerformDepthFirstTraversalFromRoot() {
        loadTreeWithTestData()
        tree?.performDepthFirstTraversalFromRoot { $0.associatedValue?.append("+Test") }
        XCTAssertEqual(tree?.root?.associatedValue, "root+Test")
    }
    
    func testPerformLevelOrderTraversalFromRoot() {
        loadTreeWithTestData()
        tree?.performLevelOrderTraversalFromRoot { $0.associatedValue?.append("+Test") }
        XCTAssertEqual(tree?.root?.associatedValue, "root+Test")
    }
    
    func testPerformLevelOrderSearchFromRoot() {
        loadTreeWithTestData()
        let searchResult = tree?.performLevelOrderSearchFromRoot(searchValue: "leftChild11")
        XCTAssertEqual(searchResult?.associatedValue, nil)
        let searchResult2 = tree?.performLevelOrderSearchFromRoot(searchValue: "leftChild1")
        XCTAssertEqual(searchResult2?.associatedValue, "leftChild1")
    }
    
}
