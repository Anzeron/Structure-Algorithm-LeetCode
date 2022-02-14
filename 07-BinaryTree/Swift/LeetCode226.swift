//
//  LeetCode226.swift
//  07-BinaryTree
//
//  Created by Anzeron on 2022/2/13.
//
/**
 来源：力扣（LeetCode）Easy
 链接：https://leetcode-cn.com/problems/invert-binary-tree
 
 给你一棵二叉树的根节点 root ，翻转这棵二叉树，并返回其根节点。
 
 示例 1：
 输入：root = [4,2,7,1,3,6,9]
 输出：[4,7,2,9,6,3,1]
 
 示例 2：
 输入：root = [2,1,3]
 输出：[2,3,1]
 
 示例 3：
 输入：root = []
 输出：[]
 */

import Foundation

class LeetCode226 {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        _ = invertTree(root?.left)
        _ = invertTree(root?.right)
        
        (root!.left, root!.right) = (root?.right, root?.left)
        
        return root
    }
}
