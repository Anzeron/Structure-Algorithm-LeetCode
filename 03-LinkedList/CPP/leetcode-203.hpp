//
//  leetcode-203.hpp
//  03-LinkedList
//
//  Created by Anzeron on 2021/12/20.
//

/**
 来源：力扣（LeetCode）203 Easy
 链接：https://leetcode-cn.com/problems/remove-linked-list-elements
 
 给你一个链表的头节点 head 和一个整数 val ，请你删除链表中所有满足 Node.val == val 的节点，并返回 新的头节点 。

 示例 1：
 输入：head = [1,2,6,3,4,5,6], val = 6
 输出：[1,2,3,4,5]

 */

#include <iostream>
#include "ListNode.hpp"

namespace LeetCode203 {

class Solution {
public:
    ListNode* removeElements(ListNode* head, int val) {
        ListNode *dummyHead = new ListNode(0);
        dummyHead->next = head;
        
        ListNode *pre = dummyHead;
        ListNode *current = head;
        
        while (current != nullptr) {
            ListNode *next = current->next;
            
            if (current->val == val) {
                current->next = nullptr;
                pre->next = next;
                
                delete current;
            } else {
                pre = current;
            }
            
            current = next;
        }
        
        head = dummyHead->next;
        delete dummyHead;
        
        return head;
    }
};

void run() {
    int arr[] = {1,2,6,3,4,5,6};
    ListNode *h = create(arr,6);
    
    Solution s;
    h = s.removeElements(h, 6);
    
    print(h);
    clean(h);
}

}


