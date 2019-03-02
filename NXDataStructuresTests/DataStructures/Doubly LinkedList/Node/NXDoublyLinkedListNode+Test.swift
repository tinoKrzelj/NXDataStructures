//
//  NXDoublyLinkedListNode+Test.swift
//  NXDataStructuresTests
//
//  Created by Tino Krželj on 25/02/2019.
//  Copyright © 2019 Tino Krželj. All rights reserved.
//

import XCTest
@testable import NXDataStructures

class NXDoublyLinkedListNode_Test: XCTestCase {
    //
    // MARK: Custom Methods
    //
    
    override func setUp() {}
    override func tearDown() { }
    
    func testDoublyLinkedListNode() {
        let node = NXDoublyLinkedListNode(associatedValue: 4)
        let node2 = NXDoublyLinkedListNode(associatedValue: 3, previousNode: node)
        XCTAssertEqual(node2.associatedValue, 3)
        XCTAssertEqual(node2.previousNode?.associatedValue, node.associatedValue)
    }
    
    func testNodeDescription() {
        let node = NXDoublyLinkedListNode(associatedValue: 4)
        XCTAssertEqual(node.description, "Optional(4)")
    }

}
