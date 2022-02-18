//
//  LeetCode257.swift
//  07-BinaryTree
//
//  Created by Anzeron on 2022/2/18.
//
/**
 来源：力扣（LeetCode）Easy
 链接：https://leetcode-cn.com/problems/binary-tree-paths
 
 给你一个二叉树的根节点 root ，按 任意顺序 ，返回所有从根节点到叶子节点的路径。
 叶子节点 是指没有子节点的节点。

 示例 1：
 输入：root = [1,2,3,null,5]
 输出：["1->2->5","1->3"]
 
 示例 2：
 输入：root = [1]
 输出：["1"]
 */

import Foundation

class LeetCode257 {
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        if root == nil {
            return []
        }
        
        if root?.left == nil && root?.right == nil {
            return ["\(root!.val)"]
        }
        
        var paths: [String] = [String]()
        
        let leftPaths = binaryTreePaths(root?.left)
        for aPath in leftPaths {
            paths.append("\(root!.val)" + "->" + aPath)
        }
        
        let rightPaths = binaryTreePaths(root?.right)
        for aPath in rightPaths {
            paths.append("\(root!.val)" + "->" + aPath)
        }
        
        return paths
    }
}

   
