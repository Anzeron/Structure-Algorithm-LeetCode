//
//  LeetCode102.swift
//  05-Queue
//
//  Created by Anzeron on 2022/1/21.
//
/**
 来源：力扣（LeetCode）102 Medium
 链接：https://leetcode-cn.com/problems/binary-tree-level-order-traversal
 
 给你二叉树的根节点 root ，返回其节点值的 层序遍历 。 （即逐层地，从左到右访问所有节点）。
 
 示例 1：
 输入：root = [3,9,20,null,null,15,7]
 输出：[[3],[9,20],[15,7]]
 
 示例 2：
 输入：root = [1]
 输出：[[1]]
 
 示例 3：
 输入：root = []
 输出：[]
 
 */

import Foundation
class LeetCode71 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        
        var queue: [TreeNode] = [root!]
        var results: [[Int]] = [[Int]]()
        
        while !queue.isEmpty {
            // 当前层的node个数
            let levelCount = queue.count
            var levelList: [Int] = [Int]()
            for _ in 1...levelCount {
                let levelNode = queue.removeFirst()
                levelList.append(levelNode.val)
                
                // 下一层的node，入队
                if let left = levelNode.left {
                    queue.append(left)
                }
                if let right = levelNode.right {
                    queue.append(right)
                }
            }
            
            results.append(levelList)
        }
        
        return results
    }
}
