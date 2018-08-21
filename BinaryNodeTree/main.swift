//
//  main.swift
//  BinaryNodeTree
//
//  Created by Wisan Janchot on 21/8/2561 BE.
//  Copyright © 2561 Wisan Janchot. All rights reserved.
//

import Foundation

if CommandLine.argc > 1 {
    if let level = UInt(CommandLine.arguments[1]) {
        print("\(level) levels: Adding child with random datas")
        let tree = Tree(root: Node())
        tree.create(with: .level(level))
    }
}

print("\nBinary Tree: Adding nodes manually")
let bT = BinaryNode(1)
bT.left = BinaryNode(2)
bT.right = BinaryNode(-3)
bT.left?.left = BinaryNode(4)
bT.left?.right = BinaryNode(-5)
bT.left?.right?.left = BinaryNode(8)
bT.left?.right?.right = BinaryNode(9)
bT.right?.left = BinaryNode(6)
bT.right?.right = BinaryNode(7)
bT.right?.right?.left = BinaryNode(10)
bT.right?.right?.left?.right = BinaryNode(11)
bT.right?.right?.left?.right?.left = BinaryNode(12)
bT.right?.right?.left?.right?.right = BinaryNode(-13)

bT.printLevelByLevel()
