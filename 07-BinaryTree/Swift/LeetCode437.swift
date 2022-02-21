//
//  LeetCode437.swift
//  07-BinaryTree
//
//  Created by Anzeron on 2022/2/21.
//
/**
 来源：力扣（LeetCode）Medium
 链接：https://leetcode-cn.com/problems/path-sum-iii
 
 给定一个二叉树的根节点 root ，和一个整数 targetSum ，求该二叉树里节点值之和等于 targetSum 的 路径 的数目。
 路径 不需要从根节点开始，也不需要在叶子节点结束，但是路径方向必须是向下的（只能从父节点到子节点）。

 示例 1：
 输入：root = [10,5,-3,3,2,null,11,3,-2,null,1], targetSum = 8
 输出：3
 解释：和等于 8 的路径有 3 条，如图所示。
 
 示例 2：
 输入：root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
 输出：3
 */

import Foundation

class LeetCode437 {
    // 路径和为targetSum的数量
    // 不要求开始是root结点,不要求结束是叶子结点
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        if root == nil {
            return 0
        }
        
        var count = 0
        count += rootPathSum(root, targetSum)
        count += pathSum(root?.left, targetSum)
        count += pathSum(root?.right, targetSum)
        
        return count
    }
    
    // 要求开始是root结点，路径和为targetSum的数量
    // 不要求结束点是叶子结点
    func rootPathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        if root == nil {
            return 0
        }
        
        var count = 0
        if root!.val == targetSum {
            count += 1
        }
        count += rootPathSum(root?.left, targetSum - root!.val)
        count += rootPathSum(root?.right, targetSum - root!.val)
        
        return count
    }
}
