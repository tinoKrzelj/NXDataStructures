//
//  NXDoublyLinkedList+Test.swift
//  NXDataStructuresTests
//
//  Created by Tino Krželj on 25/02/2019.
//  Copyright © 2019 Tino Krželj. All rights reserved.
//

import XCTest
@testable import NXDataStructures

class NXDoublyLinkedList_Test: XCTestCase {
    //
    // MARK: Properties
    //
    
    private lazy var doublyLinkedList = NXDoublyLinkedList<Int>()
    
    //
    // MARK: Custom methods
    //
    
    override func setUp() { }
    override func tearDown() { }
    
    func testAddAtBeginingMethod() {
        doublyLinkedList.addNodeAtBegining(withValue: 4)
        doublyLinkedList.addNodeAtBegining(withValue: 5)
        XCTAssertEqual(doublyLinkedList.head?.associatedValue, 5)
        XCTAssertEqual(doublyLinkedList.head?.previousNode?.associatedValue, nil)
        XCTAssertEqual(doublyLinkedList.tail?.previousNode?.associatedValue, 5)
    }
    
    func testAddAtEndMethod() {
        doublyLinkedList.addNodeAtEnd(withValue: 6)
        doublyLinkedList.addNodeAtEnd(withValue: 7)
        doublyLinkedList.addNodeAtEnd(withValue: 8)
        XCTAssertEqual(doublyLinkedList.tail?.associatedValue, 8)
        XCTAssertEqual(doublyLinkedList.tail?.previousNode?.associatedValue, 7)
    }
    
    func testNodeAtIndexMethod() {
        doublyLinkedList.addNodeAtBegining(withValue: 2)
        doublyLinkedList.addNodeAtBegining(withValue: 3)
        doublyLinkedList.addNodeAtBegining(withValue: 4)
        XCTAssertEqual(doublyLinkedList.node(atIndex: 1)?.associatedValue, 3)
    }

    func testAddNodeAfterNodeAtIndex() {
        doublyLinkedList.addNodeAtBegining(withValue: 2)
        doublyLinkedList.addNodeAtBegining(withValue: 3)
        doublyLinkedList.addNodeAtBegining(withValue: 4)
        guard let node = doublyLinkedList.node(atIndex: 1) else { return }
        doublyLinkedList.addNodeAfter(node: node, withValue: 8)
        XCTAssertEqual(doublyLinkedList.node(atIndex: 2)?.associatedValue, 8)
        XCTAssertEqual(doublyLinkedList.node(atIndex: 3)?.previousNode?.associatedValue, 8)
    }
    
    func testAddNodeBeforeNodeAtIndex() {
        doublyLinkedList.addNodeAtBegining(withValue: 2)
        doublyLinkedList.addNodeAtBegining(withValue: 3)
        doublyLinkedList.addNodeAtBegining(withValue: 4)
        guard let node = doublyLinkedList.node(atIndex: 1) else { return }
        doublyLinkedList.addNodeBefore(node: node, withValue: 8)
        doublyLinkedList.printDoublyLinkedList()
        XCTAssertEqual(doublyLinkedList.node(atIndex: 1)?.associatedValue, 8)
        XCTAssertEqual(doublyLinkedList.node(atIndex: 3)?.previousNode?.associatedValue, 3)
        XCTAssertEqual(doublyLinkedList.node(atIndex: 2)?.previousNode?.associatedValue, 8)
    }

    func testRemoveFirstMethod() {
        doublyLinkedList.addNodeAtBegining(withValue: 2)
        doublyLinkedList.addNodeAtBegining(withValue: 3)
        doublyLinkedList.addNodeAtBegining(withValue: 4)
        XCTAssertEqual(doublyLinkedList.removeFirst()?.associatedValue, 4)
        XCTAssertEqual(doublyLinkedList.head?.previousNode?.associatedValue, nil)
        XCTAssertEqual(doublyLinkedList.tail?.previousNode?.associatedValue, 3)
    }

    func testRemoveLastMethod() {
        doublyLinkedList.addNodeAtBegining(withValue: 2)
        doublyLinkedList.addNodeAtBegining(withValue: 3)
        doublyLinkedList.addNodeAtBegining(withValue: 4)
        XCTAssertEqual(doublyLinkedList.removeLast()?.associatedValue, 2)
        XCTAssertEqual(doublyLinkedList.tail?.previousNode?.associatedValue, 4)
        XCTAssertEqual(doublyLinkedList.head?.previousNode?.associatedValue, nil)
    }
    
    func testRemoveAfterMethod() {
        doublyLinkedList.addNodeAtBegining(withValue: 2)
        doublyLinkedList.addNodeAtBegining(withValue: 3)
        doublyLinkedList.addNodeAtBegining(withValue: 4)
        doublyLinkedList.addNodeAtBegining(withValue: 5)
        doublyLinkedList.printDoublyLinkedList()
        doublyLinkedList.printReversedDoublyLinkedList()
        guard let searchNode = doublyLinkedList.node(atIndex: 1) else { return }
        XCTAssertEqual(doublyLinkedList.removeAfter(node: searchNode)?.associatedValue, 3)
        XCTAssertEqual(searchNode.previousNode?.associatedValue, 5)
        guard let searchNode2 = doublyLinkedList.node(atIndex: 1) else { return }
        XCTAssertEqual(doublyLinkedList.removeAfter(node: searchNode2)?.associatedValue, 2)
        XCTAssertEqual(searchNode2.previousNode?.associatedValue, 5)
    }
    
    func testRemoveBeforeMethod() {
        doublyLinkedList.addNodeAtBegining(withValue: 2)
        doublyLinkedList.addNodeAtBegining(withValue: 3)
        doublyLinkedList.addNodeAtBegining(withValue: 4)
        doublyLinkedList.addNodeAtBegining(withValue: 5)
        guard let searchNode = doublyLinkedList.node(atIndex: 2) else { return }
        XCTAssertEqual(doublyLinkedList.removeBefore(node: searchNode)?.associatedValue, 4)
        XCTAssertEqual(searchNode.previousNode?.associatedValue, 5)
        guard let searchNode2 = doublyLinkedList.node(atIndex: 1) else { return }
        XCTAssertEqual(doublyLinkedList.removeBefore(node: searchNode2)?.associatedValue, 5)
        XCTAssertEqual(searchNode2.previousNode?.associatedValue, nil)
    }
    
    func testPeekFirst() {
        doublyLinkedList.addNodeAtBegining(withValue: 2)
        doublyLinkedList.addNodeAtBegining(withValue: 3)
        doublyLinkedList.addNodeAtBegining(withValue: 4)
        XCTAssertEqual(doublyLinkedList.peekFirst()?.associatedValue, 4)
    }
    
    func testPeekLast() {
        doublyLinkedList.addNodeAtBegining(withValue: 2)
        doublyLinkedList.addNodeAtBegining(withValue: 3)
        doublyLinkedList.addNodeAtBegining(withValue: 4)
        XCTAssertEqual(doublyLinkedList.peekLast()?.associatedValue, 2)
    }
    
}

