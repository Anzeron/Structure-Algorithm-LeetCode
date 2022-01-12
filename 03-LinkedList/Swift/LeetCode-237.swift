//
//  LeetCode-237.swift
//  03-LinkedList
//
//  Created by Anzeron on 2022/1/12.
//
/**
 来源：力扣（LeetCode）203 Easy
 链接：https://leetcode-cn.com/problems/delete-node-in-a-linked-list
 
 请编写一个函数，用于 删除单链表中某个特定节点 。在设计函数时需要注意，你无法访问链表的头节点 head ，只能直接访问 要被删除的节点 。

 题目数据保证需要删除的节点 不是末尾节点。
 
 输入：head = [4,5,1,9], node = 5
 输出：[4,1,9]
 
 */

import Foundation

class LeetCode237 {
    func deleteNode(_ node: ListNode?) {
        if let nextNum = node?.next?.val {
            node?.val = nextNum // 当前结点的值，变成下一个结点的值
            
            node?.next = node?.next?.next   // 移除下一个结点
        }
    }
    
    static func run() -> Void {
        let head = create([4,5,1,9])
        LeetCode237().deleteNode(head?.next)
        print(head)
    }
}
