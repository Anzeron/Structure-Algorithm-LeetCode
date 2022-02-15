//
//  LeetCode112.swift
//  07-BinaryTree
//
//  Created by Anzeron on 2022/2/15.
//

import Foundation

class LeetCode112 {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        if root == nil {
            return false
        }
        
        // 注意：递归的终止条件，必须是叶子结点
        if root!.left == nil && root!.right == nil {
            return root!.val == targetSum
        }
        
        return hasPathSum(root?.left, targetSum - root!.val) ||
            hasPathSum(root?.right, targetSum - root!.val)
    }
}
