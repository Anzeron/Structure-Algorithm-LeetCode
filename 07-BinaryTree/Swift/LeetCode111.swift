//
//  LeetCode111.swift
//  07-BinaryTree
//
//  Created by Anzeron on 2022/2/16.
//
/**
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/minimum-depth-of-binary-tree
 
 给定一个二叉树，找出其最小深度。
 最小深度是从根节点到最近叶子节点的最短路径上的节点数量。
 说明：叶子节点是指没有子节点的节点。

 示例 1：
 输入：root = [3,9,20,null,null,15,7]
 输出：2
 
 示例 2：
 输入：root = [2,null,3,null,4,null,5,null,6]
 输出：5
 */

import Foundation

class LeetCode111 {
    // 从root到叶子结点的最小深度
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        // 存在左右结点
        if root?.left != nil && root?.right != nil {
            return 1 + min(minDepth(root?.left), minDepth(root?.right))
        } else {
            return 1 + minDepth(root?.left) + minDepth(root?.right)
        }
    }
}
