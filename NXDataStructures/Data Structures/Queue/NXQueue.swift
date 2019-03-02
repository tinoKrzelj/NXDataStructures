//
//  NXQueue.swift
//  NXDataStructures
//
//  Created by Tino Krželj on 20/02/2019.
//  Copyright © 2019 Tino Krželj. All rights reserved.
//

import Foundation

public struct NXQueue<T> {
    //
    // MARK: Properties
    //
    
    private var queue = NXDoublyLinkedList<T>()
    
    //
    // MARK: Methods
    //
    
    public func empty() -> Bool {
        return queue.empty()
    }
    
    /**
     Will enqueue new element.
     
     - parameters:
        - newElement: Element that will be enqueued
     */
    public mutating func enqueue(newElement element: T) {
        queue.addNodeAtEnd(withValue: element)
    }
    
    /// Will dequeue new element.
    public mutating func dequeue() -> T? {
        return queue.removeFirst()?.associatedValue
    }
    
    /// Will peek on first (leading) element.
    public mutating func peekFirst() -> T? {
        return queue.peekFirst()?.associatedValue
    }
    
    /// Will peek on trailing (last) element.
    public mutating func peekLast() -> T? {
        return queue.peekLast()?.associatedValue
    }
    
    /// Will print complete queue to the terminal
    public mutating func printQueue() {
        NXLog.log(message: "Queue => ")
        self.queue.printDoublyLinkedList()
    }

}
