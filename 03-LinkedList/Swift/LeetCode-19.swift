//
//  LeetCode19.swift
//  03-LinkedList
//
//  Created by Anzeron on 2022/1/12.
//
/**
 来源：力扣（LeetCode）19 Medium
 链接：https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list
 
 给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。
 
 示例 1：
 输入：head = [1,2,3,4,5], n = 2
 输出：[1,2,3,5]
 
 示例 2：
 输入：head = [1], n = 1
 输出：[]
  
 */

import Foundation

class LeetCode19 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummyHead = ListNode(0)
        dummyHead.next = head
        
        var pre: ListNode? = dummyHead
        var tail: ListNode? = dummyHead
        
        // 先走n+1步
        for _ in 0...n {
            tail = tail?.next
        }
        
        // 一起走到最后
        while tail != nil {
            pre = pre?.next
            tail = tail?.next
        }
        
        // 删除结点
        pre?.next = pre?.next?.next
        
        return dummyHead.next
    }
    
    static func run() -> Void {
        var head = create([1,2,3,4,5])
        head = LeetCode19().removeNthFromEnd(head,2)
        print(head)
    }
}
