//
//  NXStack+Test.swift
//  NXDataStructuresTests
//
//  Created by Tino Krželj on 18/02/2019.
//  Copyright © 2019 Tino Krželj. All rights reserved.
//

import XCTest
@testable import NXDataStructures

final class NXStack_Test: XCTestCase {
    //
    // MARK: Properties
    //
    
    private lazy var stack = NXStack<Int>()

    //
    // MARK: Custom Methods
    //
    
    override func setUp() {}
    override func tearDown() {}
    
    func testCount() {
        stack.push(2)
        stack.push(3)
        XCTAssertEqual(stack.count(), 2)
    }
    
    func testPushMethods() {
        stack.push(4)
        stack.push(5)
        XCTAssertEqual(stack.count(), 2)
        stack.push(1, atIndex: 0)
        stack.push(2, atIndex: 1)
        XCTAssertEqual(stack.count(), 4)
    }
    
    func testPopMethods() {
        stack.push(4)
        stack.push(5)
        XCTAssertEqual(stack.pop(), 5)
        XCTAssertEqual(stack.pop(atIndex: 0), 4)
        stack.push(2)
        stack.push(3)
        stack.popAll()
        XCTAssertEqual(stack.count(), 0)
    }
    
    func testPeekMethods() {
        stack.push(4)
        stack.push(7)
        XCTAssertEqual(stack.peek(), 7)
        XCTAssertEqual(stack.peek(atIndex: 0), 4)
    }
    
    func testMoveMethods() {
        stack.push(4)
        stack.push(2)
        stack.push(5)
        stack.move(element: 2, atIndex: 0)
        XCTAssertEqual(stack.peek(atIndex: 0), 2)
        stack.move(elementAtIndex: 0, atIndex: 2)
        XCTAssertEqual(stack.peek(atIndex: 2), 2)
    }
    
    func testContainsMethod() {
        stack.push(4)
        stack.push(5)
        XCTAssertEqual(stack.contains(3), false)
    }
    
}
