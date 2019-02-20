//
//  NXLinkedList+Test.swift
//  NXDataStructuresTests
//
//  Created by Tino Krželj on 19/02/2019.
//  Copyright © 2019 Tino Krželj. All rights reserved.
//

import XCTest
@testable import NXDataStructures

class NXLinkedList_Test: XCTestCase {
    //
    // MARK: Properties
    //
    
    private lazy var linkedList = NXLinkedList<Int>()
    
    //
    // MARK: Custom Methods
    //
    
    override func setUp() {}
    override func tearDown() {}
    
    func testAddAtBeginingMethod() {
        linkedList.addNodeAtBegining(withValue: 4)
        linkedList.addNodeAtBegining(withValue: 5)
        XCTAssertEqual(linkedList.head?.associatedValue, 5)
    }
    
    func testAddAtEndMethod() {
        linkedList.addNodeAtEnd(withValue: 6)
        linkedList.addNodeAtEnd(withValue: 7)
        XCTAssertEqual(linkedList.tail?.associatedValue, 7)
    }
    
    func testAddAtIndexMethod() {
        guard let node = linkedList.node(atIndex: 1) else { return }
        linkedList.addNoteAfter(node: node, withValue: 8)
        XCTAssertEqual(linkedList.node(atIndex: 2)?.associatedValue, 8)
    }
    
    func testNodeAtIndexMethod() {
        linkedList.addNodeAtBegining(withValue: 2)
        linkedList.addNodeAtBegining(withValue: 3)
        linkedList.addNodeAtBegining(withValue: 4)
        XCTAssertEqual(linkedList.node(atIndex: 1)?.associatedValue, 3)
    }
    
    func testRemoveFirstMethod() {
        linkedList.addNodeAtBegining(withValue: 2)
        linkedList.addNodeAtBegining(withValue: 3)
        linkedList.addNodeAtBegining(withValue: 4)
        XCTAssertEqual(linkedList.removeFirst()?.associatedValue, 4)
    }
    
    func testRemoveLastMethod() {
        linkedList.addNodeAtBegining(withValue: 2)
        linkedList.addNodeAtBegining(withValue: 3)
        linkedList.addNodeAtBegining(withValue: 4)
        XCTAssertEqual(linkedList.removeLast()?.associatedValue, 2)
    }
    
    func testRemoveAfterMethod() {
        linkedList.addNodeAtBegining(withValue: 2)
        linkedList.addNodeAtBegining(withValue: 3)
        linkedList.addNodeAtBegining(withValue: 4)
        linkedList.addNodeAtBegining(withValue: 5)
        guard let searchNode = linkedList.node(atIndex: 1) else { return }
        XCTAssertEqual(linkedList.removeAfter(node: searchNode)?.associatedValue, 3)
    }
    
}
