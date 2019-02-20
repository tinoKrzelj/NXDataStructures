//
//  NXLinkedListNode+Test.swift
//  NXDataStructuresTests
//
//  Created by Tino Krželj on 19/02/2019.
//  Copyright © 2019 Tino Krželj. All rights reserved.
//

import XCTest
@testable import NXDataStructures

class NXLinkedListNode_Test: XCTestCase {
    //
    // MARK: Custom Methods
    //
    
    override func setUp() {}
    override func tearDown() {}

    func testLinkedListNode() {
        let node = NXLinkedListNode(associatedValue: 4, nextNode: nil)
        let node2 = NXLinkedListNode(associatedValue: 3, nextNode: node)
        XCTAssertEqual(node2.associatedValue, 3)
        XCTAssertEqual(node2.nextNode?.associatedValue, node.associatedValue)
    }
    
    func testNodeDescription() {
        let node = NXLinkedListNode(associatedValue: 4)
        XCTAssertEqual(node.description, "Optional(4)")
    }

}
