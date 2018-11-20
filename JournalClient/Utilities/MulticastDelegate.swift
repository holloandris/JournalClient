//
//  MulticastDelegate.swift
//  JournalClient
//
//  Created by Andras Hollo on 2018. 11. 09..
//  Copyright © 2018. Andras Hollo. All rights reserved.
//

import Foundation

class MulticastDelegate<T> {
    private let delegates: NSHashTable<AnyObject> = NSHashTable.weakObjects()
    
    func add(delegate: T) {
        delegates.add(delegate as AnyObject)
    }
    
    func remove(delegate: T) {
        for oneDelegate in delegates.allObjects.reversed() {
            if oneDelegate === delegate as AnyObject {
                delegates.remove(oneDelegate)
            }
        }
    }
    
    func invoke(invocation: (T) -> ()) {
        for delegate in delegates.allObjects.reversed() {
            invocation(delegate as! T)
        }
    }
    
    static func +=(lhs: inout MulticastDelegate<T>, rhs: T) {
        lhs.add(delegate: rhs)
    }
    
    static func -=(lhs: inout MulticastDelegate<T>, rhs: T) {
        lhs.remove(delegate: rhs)
    }
}
