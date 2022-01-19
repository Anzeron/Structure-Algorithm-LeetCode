//
//  LeetCode144.swift
//  04-Stack
//
//  Created by Anzeron on 2022/1/18.
//
/**
 来源：力扣（LeetCode）144 Easy
 链接：https://leetcode-cn.com/problems/binary-tree-preorder-traversal
 
 给你二叉树的根节点 root ，返回它节点值的 前序 遍历。
 
 输入：root = [1,null,2,3]
 输出：[1,2,3]
 示例 2：

 输入：root = []
 输出：[]
 示例 3：

 输入：root = [1]
 输出：[1]
 */

import Foundation

class Action {
    // 0 visit
    // 1 print
    var type: Int
    var node: TreeNode
    public init(_ type:Int,_ node: TreeNode) {
        self.type = type
        self.node = node
    }
}

class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        
        // 初始化，第一个Action是visit
        var stack: [Action] = [Action]()
        let action: Action = Action(0, root!)
        stack.append(action)
        
        var results: [Int] = [Int]()
        
        while !stack.isEmpty {
            if let action = stack.popLast() {
                if action.type == 0 {
                    // Action入栈
                    // 最后入栈的action是print，最先处理
                    if let rightNode = action.node.right {
                        stack.append(Action(0, rightNode))
                    }
                    if let leftNode = action.node.left {
                        stack.append(Action(0, leftNode))
                    }
                    stack.append(Action(1, action.node))
                } else {
                    results.append(action.node.val)
                }
            }
        }
        
        return results
    }
}
