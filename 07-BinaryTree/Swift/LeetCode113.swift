//
//  LeetCode113.swift
//  07-BinaryTree
//
//  Created by Anzeron on 2022/5/22.
//
/**
 来源：力扣（LeetCode）Medium
 链接：https://leetcode.cn/problems/path-sum-ii
 
 给你二叉树的根节点 root 和一个整数目标和 targetSum ，找出所有 从根节点到叶子节点 路径总和等于给定目标和的路径。

 叶子节点 是指没有子节点的节点。
 
 示例 1:
 输入：root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
 输出：[[5,4,11,2],[5,8,4,5]]

 */

import Foundation

class LeetCode113 {
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        if root == nil {
            return []
        }
        
        // 叶子结点
        let currentNum = root!.val
        if root?.left == nil && root?.right == nil && targetSum == currentNum  {
            return [[currentNum]]
        }
        
        // 左右子树的结果，加上当前结点
        var result = [[Int]]()
        
        let lefts = pathSum(root?.left, targetSum - currentNum)
        for aResult in lefts {
            var temp = aResult
            temp.insert(currentNum, at: 0)
            result.append(temp)
        }
        
        let rights = pathSum(root?.right, targetSum - currentNum)
        for aResult in rights {
            var temp = aResult
            temp.insert(currentNum, at: 0)
            result.append(temp)
        }
        
        return result
    }
}
