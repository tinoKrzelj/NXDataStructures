//
//  NXQueue+Test.swift
//  NXDataStructuresTests
//
//  Created by Tino Krželj on 20/02/2019.
//  Copyright © 2019 Tino Krželj. All rights reserved.
//

import XCTest
@testable import NXDataStructures

class NXQueue_Test: XCTestCase {
    //
    // MARK: Properties
    //
    
    var queue = NXQueue<Int>()

    //
    // MARK: Custom Methods
    //
    
    override func setUp() {}
    override func tearDown() {}
    
    func testEnqueMethod() {
        queue.enqueue(newElement: 5)
        queue.enqueue(newElement: 4)
        queue.enqueue(newElement: 3)
        queue.enqueue(newElement: 4)
        queue.printQueue()
        XCTAssertEqual(queue.peekFirst(), 5)
        XCTAssertEqual(queue.peekLast(), 4)
    }
    
    func testDequeMethod() {
        queue.enqueue(newElement: 5)
        queue.enqueue(newElement: 4)
        queue.enqueue(newElement: 3)
        queue.enqueue(newElement: 4)
        XCTAssertEqual(queue.dequeue(), 5)
        XCTAssertEqual(queue.dequeue(), 4)
    }
    
    func testEmptyMethod() {
        XCTAssertEqual(queue.empty(), true)
        queue.enqueue(newElement: 5)
        queue.enqueue(newElement: 4)
        XCTAssertEqual(queue.empty(), false)
    }
    
    func testPeekFirstMethod() {
        queue.enqueue(newElement: 5)
        queue.enqueue(newElement: 4)
        queue.enqueue(newElement: 3)
        XCTAssertEqual(queue.peekFirst(), 5)
    }
    
    
    func testPeekLastMethod() {
        queue.enqueue(newElement: 5)
        queue.enqueue(newElement: 4)
        queue.enqueue(newElement: 3)
        XCTAssertEqual(queue.peekLast(), 3)
    }
    
}

