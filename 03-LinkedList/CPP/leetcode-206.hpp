//
//  leetcode-206.hpp
//  03-LinkedList
//
//  Created by jiayou on 2021/12/20.
//

/**
 来源：力扣（LeetCode）206 Easy
 链接：https://leetcode-cn.com/problems/reverse-linked-list
 
 给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。

 示例 1：
 输入：head = [1,2,3,4,5]
 输出：[5,4,3,2,1]

 */

#include <iostream>
#include "ListNode.hpp"

namespace LeetCode206 {

class Solution {
public:
    ListNode* reverseList(ListNode* head) {
        ListNode *pre = nullptr;
        ListNode *current = head;
        while (current != nullptr) {
            ListNode *next = current->next;
            
            // 反转
            current->next = pre;
            
            // 调整指针，准备进行下一次反转
            pre = current;
            current = next;
        }
        
        return pre;
    }
};

void run() {
    int arr[] = {1,2,3,4,5};
    ListNode *h = create(arr,5);
    
    Solution s;
    h = s.reverseList(h);
    
    print(h);
    clean(h);
}

}


