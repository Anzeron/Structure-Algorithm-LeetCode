//
//  LeetCode129.swift
//  07-BinaryTree
//
//  Created by Anzeron on 2022/5/29.
//
/**
 来源：力扣（LeetCode）Medium
 链接：https://leetcode.cn/problems/sum-root-to-leaf-numbers
 
 给你一个二叉树的根节点 root ，树中每个节点都存放有一个 0 到 9 之间的数字。
 每条从根节点到叶节点的路径都代表一个数字：

 例如，从根节点到叶节点的路径 1 -> 2 -> 3 表示数字 123 。
 计算从根节点到叶节点生成的 所有数字之和 。
 叶节点 是指没有子节点的节点。
 
 示例 1：
 输入：root = [1,2,3]
 输出：25
 解释：
 从根到叶子节点路径 1->2 代表数字 12
 从根到叶子节点路径 1->3 代表数字 13
 因此，数字总和 = 12 + 13 = 25
 
 示例 2：
 输入：root = [4,9,0,5,1]
 输出：1026
 解释：
 从根到叶子节点路径 4->9->5 代表数字 495
 从根到叶子节点路径 4->9->1 代表数字 491
 从根到叶子节点路径 4->0 代表数字 40
 因此，数字总和 = 495 + 491 + 40 = 1026

 */

import Foundation

class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        let paths = self.paths(root)
        
        // 字符串转成数字，求和
        var sum = 0
        for path in paths {
            sum += (Int(path) ?? 0)
        }
        
        return sum
    }
    
    // 根到叶子节点路径字符串
    func paths(_ root: TreeNode?) -> [String] {
        guard root != nil else {
            return []
        }
        
        // 叶子结点
        if root?.left == nil && root?.right == nil {
            return ["\(root!.val)"]
        }
        
        // 左右子树至少有一个
        let leftPaths = self.paths(root?.left)
        let rightPaths = self.paths(root?.right)
        
        var allPaths = [String]()
        for path in leftPaths {
            allPaths.append("\(root!.val)" + path)
        }
        for path in rightPaths {
            allPaths.append("\(root!.val)" + path)
        }
        
        return allPaths
    }
}
