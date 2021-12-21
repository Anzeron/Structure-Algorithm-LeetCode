//
//  LeetCode-203.swift
//  03-LinkedList
//
//  Created by Anzeron on 2021/12/21.
//

/**
 来源：力扣（LeetCode）203 Easy
 链接：https://leetcode-cn.com/problems/remove-linked-list-elements
 
 给你一个链表的头节点 head 和一个整数 val ，请你删除链表中所有满足 Node.val == val 的节点，并返回 新的头节点 。

 示例 1：
 输入：head = [1,2,6,3,4,5,6], val = 6
 输出：[1,2,3,4,5]

 */

import Foundation

class LeetCode203 {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummyHead = ListNode()
        dummyHead.next = head
        
        var pre: ListNode? = dummyHead
        var current: ListNode? = head
        
        while current != nil {
            let next = current?.next
            
            if current?.val == val {
                pre?.next = next    // 移除current
            } else {
                pre = current
            }
            
            current = next
        }
        
        return dummyHead.next
    }

    static func run() -> Void {
        var head = create([1,2,6,3,4,5,6])
        head = LeetCode203().removeElements(head, 6)
        print(head)
    }
}
