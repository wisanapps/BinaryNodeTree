//
//  Tree.swift
//  BinaryNodeTree
//
//  Created by Wisan Janchot on 21/8/2561 BE.
//  Copyright © 2561 Wisan Janchot. All rights reserved.
//
// For creating a tree with random node data.


//import Foundation


class Tree {
    
    let root: Node
    
    private var totalRool: UInt = 0
    private var possiblePathToTarget: UInt = 0
    private var lastTargetNodeList: [Node] = []
    
    init(root: Node) {
        self.root = root
    }
    
    enum TreeCreationOption {
        case level(UInt)
    }
    
    func create(with option: TreeCreationOption) {
        switch option {
        case .level(let x):
            createTree(levels: x)
            printLevelByLevel()
        }
    }//end func create(with option: TreeCreationOption) {}
    
    private func createTree(levels target: UInt) {
        //queue of nodes in current level and next lower level.
        var nodeQueue: [Node]               // root is on curent level, 0
        
        nodeQueue = [root]                  // nunber of nodes on current level
        
        var currentlevelNodeCount: UInt = 1 // nunber of nodes on current leve
        var nextLevelNodeCount: UInt = 0    // number of child nodes on next lower level

        var parent: Node                    // current working node on crrent level
        
        repeat {
            parent = nodeQueue.removeFirst()        // FiFo
            addChildLoop: for i in 0..<parent.children.count {
                let child = Node(parent: parent)
                if child.level < target {
                    parent.children[i] = child
                    nodeQueue.append(child)
                    nextLevelNodeCount += 1
                    totalRool += 1
                    possiblePathToTarget += 1
                }//end if child.level <= target
            }//end addChildLoop:
            
            currentlevelNodeCount -= 1
            if currentlevelNodeCount == 0 {
                currentlevelNodeCount = nextLevelNodeCount
                nextLevelNodeCount = 0
            }
        } while !nodeQueue.isEmpty
        
    }//end func createTree(levels target: UInt) {}
    
    private func printLevelByLevel() {
        //queue of nodes in current level and next lower level.
        var nodeQueue: [Node]
        nodeQueue = [root]                      // put root node on the queue
        
        var currentlevelNodeCount: UInt = 1     // nunber of nodes on current level
        var nextLevelNodeCount: UInt = 0        // number of child nodes on next lower level
        var node: Node                          // current working node on crrent level
        
        while !nodeQueue.isEmpty {
            node = nodeQueue.removeFirst()
            
            for childNode in node.children {
                if let child = childNode {
                    nextLevelNodeCount += 1
                    nodeQueue.append(child)
                }
            }
            
            print(" \(node.data) ", separator: "", terminator: "")
            currentlevelNodeCount -= 1
            if currentlevelNodeCount == 0 {
                print()
                currentlevelNodeCount = nextLevelNodeCount
                nextLevelNodeCount = 0
            }
        }//end while !nodeQueue.isEmpty {}
        
    }//end private func printLevelByLevel()
    
}//end class Tree {}
