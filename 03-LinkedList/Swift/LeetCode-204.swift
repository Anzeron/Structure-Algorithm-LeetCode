//
//  LeetCode-204.swift
//  03-LinkedList
//
//  Created by Anzeron on 2022/1/11.
//

/**
 来源：力扣（LeetCode）204 Medium
 链接：https://leetcode-cn.com/problems/swap-nodes-in-pairs
 
 给你一个链表，两两交换其中相邻的节点，并返回交换后链表的头节点。你必须在不修改节点内部的值的情况下完成本题（即，只能进行节点交换）。
 输入：head = [1,2,3,4]
 输出：[2,1,4,3]

 */

import Foundation

class LeetCode204 {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        let dummyHead = ListNode(0)
        dummyHead.next = head
        
        var pre: ListNode? = dummyHead
        var node1 = head
        var node2 = head?.next
        
        while node1 != nil && node2 != nil {
            let next  = node2?.next
            
            // 交换
            pre?.next = node2
            node2?.next = node1
            node1?.next = next
            
            // 重新设置变量，准备下一次交换
            pre = node1
            node1 = next
            node2 = next?.next
        }
        
        return dummyHead.next
    }

    static func run() -> Void {
        var head = create([1,2,3,4])
        head = LeetCode204().swapPairs(head)
        print(head)
    }
}


