//
//  BinaryNode.swift
//  BinaryNodeTree
//
//  Created by Wisan Janchot on 21/8/2561 BE.
//  Copyright © 2561 Wisan Janchot. All rights reserved.
//

import Foundation

class BinaryNode {
    
    let data: Int
    var level: UInt = 0
    
    static var depth: UInt = 0
    
    var left: BinaryNode? {
        didSet {
            let newLevel = level + 1
            left?.level = newLevel
            if newLevel > BinaryNode.depth {
                BinaryNode.depth = newLevel }
        }
    }
    
    var right: BinaryNode? {
        didSet {
            let newLevel = level + 1
            right?.level = newLevel
            if newLevel > BinaryNode.depth {
                BinaryNode.depth = newLevel
            }
        }
    }
    
    init(_ data: Int) {
        self.data = data
    }
    
    /*
     print tree level by level */
    func printLevelByLevel() {
        // queue of nodes in current level and next lower level.
        // After done with the first node on the queue,
        // it will be removed.
        var nodeQueue: [BinaryNode]
        nodeQueue = [self]
        var currentlevelNodeCount: UInt = 1
        var nextLevelNodeCount: UInt = 0
        
        // put root node on the queue
        // nunber of nodes on current level
        // number of child nodes on next lower
        // current working node on crrent level
        var node: BinaryNode
        while !nodeQueue.isEmpty {
            node = nodeQueue.removeFirst()
            
            if let left = node.left {
                nextLevelNodeCount += 1
                nodeQueue.append(left)
            }
            
            if let right = node.right {
                nextLevelNodeCount += 1
                nodeQueue.append(right)
            }
            print(" \(node.data) ", separator: "", terminator: "")
            
            currentlevelNodeCount -= 1
            
            if currentlevelNodeCount == 0 {
                print()
                currentlevelNodeCount = nextLevelNodeCount
                nextLevelNodeCount = 0
            }
        }// while }// printTree()
    }
}
