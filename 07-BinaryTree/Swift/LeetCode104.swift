//
//  LeetCode104.swift
//  07-BinaryTree
//
//  Created by Anzeron on 2022/1/28.
//

import Foundation
class LeetCode104 {
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let leftDepth = maxDepth(root?.left)
        let rightDepth = maxDepth(root?.right)
        
        return max(leftDepth, rightDepth) + 1
    }
}
