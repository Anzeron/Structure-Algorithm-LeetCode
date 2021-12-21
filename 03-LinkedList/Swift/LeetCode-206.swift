//
//  LeetCode-206.swift
//  03-LinkedList
//
//  Created by Anzeron on 2021/12/21.
//

/**
 来源：力扣（LeetCode）206 Easy
 链接：https://leetcode-cn.com/problems/reverse-linked-list
 
 给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。

 示例 1：
 输入：head = [1,2,3,4,5]
 输出：[5,4,3,2,1]

 */

import Foundation

class LeetCode206 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var pre : ListNode? = nil
        var current : ListNode? = head
        while (current != nil) {
            let next = current?.next
            
            // 反转
            current?.next = pre
            
            // 调整指针，准备进行下一次反转
            pre = current
            current = next
        }
        
        return pre;
    }

    static func run() -> Void {
        var head = create([1,2,3,4,5])
        head = LeetCode206().reverseList(head)
        print(head)
    }
}



