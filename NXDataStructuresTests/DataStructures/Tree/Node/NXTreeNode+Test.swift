//
//  NXTreeNode+Test.swift
//  NXDataStructuresTests
//
//  Created by Tino Krželj on 03/03/2019.
//  Copyright © 2019 Tino Krželj. All rights reserved.
//

import XCTest
@testable import NXDataStructures

class NXTreeNode_Test: XCTestCase {
    //
    // MARK: Properties
    //
    
    private var rootNode: NXTreeNode<String>?
    
    //
    // MARK: Methods
    //
    
    override func setUp() { }
    override func tearDown() { }
    
    func loadTreeWithTestData() {
        rootNode = NXTreeNode(withValue: "root")
        let leftNode = NXTreeNode(withValue: "left")
        let rightNode = NXTreeNode(withValue: "right")
        let leftNodeChild1 = NXTreeNode(withValue: "leftChild1")
        let leftNodeChild2 = NXTreeNode(withValue: "leftChild2")
        let rightNodeChild1 = NXTreeNode(withValue: "rightChild1")
        let rightNodeChild2 = NXTreeNode(withValue: "rightChild2")
        rootNode?.add(newChild: leftNode)
        rootNode?.add(newChild: rightNode)
        leftNode.add(newChild: leftNodeChild1)
        leftNode.add(newChild: leftNodeChild2)
        rightNode.add(newChild: rightNodeChild1)
        rightNode.add(newChild: rightNodeChild2)
    }
    
    func testInit() {
        rootNode = NXTreeNode(withValue: "root")
        XCTAssertEqual(rootNode?.associatedValue, "root")
    }

    func testAddChildMethod() {
        loadTreeWithTestData()
        XCTAssertEqual(rootNode?.associatedValue, "root")
        XCTAssertEqual(rootNode?.children.first?.associatedValue, "left")
        XCTAssertEqual(rootNode?.children.last?.associatedValue, "right")
        XCTAssertEqual(rootNode?.children.first?.children.count, 2)
        XCTAssertEqual(rootNode?.children.last?.children.count, 2)
        rootNode?.performDepthFirstTraversal { print($0.associatedValue ?? "nil") }
        rootNode?.performLevelOrderTraversal { print($0.associatedValue ?? "nil") }
    }
    
    func testPerformDepthFirstTraversal() {
        loadTreeWithTestData()
        rootNode?.performDepthFirstTraversal { $0.associatedValue?.append("+Test") }
        XCTAssertEqual(rootNode?.children.first?.associatedValue, "left+Test")
        XCTAssertEqual(rootNode?.children.last?.associatedValue, "right+Test")
    }
    
    func testperformLevelOrderTraversal() {
        loadTreeWithTestData()
        rootNode?.performLevelOrderTraversal { $0.associatedValue?.append("+Test") }
        XCTAssertEqual(rootNode?.children.first?.associatedValue, "left+Test")
        XCTAssertEqual(rootNode?.children.last?.associatedValue, "right+Test")
    }

    func testLevelOrderSearch() {
        loadTreeWithTestData()
        let searchResult = rootNode?.performLevelOrderSearch(searchValue: "test")
        let searchResult2 = rootNode?.performLevelOrderSearch(searchValue: "leftChild1")
        XCTAssertEqual(searchResult?.associatedValue, nil)
        XCTAssertEqual(searchResult2?.associatedValue, "leftChild1")
    }
 
}
