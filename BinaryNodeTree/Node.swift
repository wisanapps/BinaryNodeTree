//
//  Node.swift
//  BinaryNodeTree
//
//  Created by Wisan Janchot on 21/8/2561 BE.
//  Copyright © 2561 Wisan Janchot. All rights reserved.
//

import Foundation

class Node {
    
    weak var parent: Node?
    var children: [Node?]
    
    let data: Int
    var pathAccomulation: UInt = 0
    var path = ""
    
    var level: UInt = 0 {
        willSet {
            guard newValue <= UInt.max else { print("level: Overflow..!"); return}
        }
    }
    
    static var depth: UInt = 0
    
    // parent
    init(_ data: Int) {
        self.data = data
        self.pathAccomulation = UInt(data)
        self.children = [nil, nil]
    }
    
    // parent
    convenience init() {
        self.init(Int(arc4random_uniform(20)))
    }
    
    // child
    convenience init(_ data: Int, parent: Node) {
        self.init(data)
        self.parent = parent
        self.level = parent.level + 1
        self.pathAccomulation = parent.pathAccomulation + UInt(data)
        self.path = (parent.path.isEmpty) ? String(data) : (parent.path + "," + String(data))
    }
    
    // child
    convenience init(parent: Node) {
        //self.init(Int(arc4random_uniform(20)), parent: parent)
        self.init(20.arc4random, parent: parent)
    }
    
}//end class Node {}


extension Int {
    var arc4random: Int {
        switch self {
        case 0:
            return 0
        case let x where x > 0:
            return Int(arc4random_uniform(UInt32(self)))
        default:
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }
    }
}
