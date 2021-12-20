//
//  ListNode.hpp
//  03-LinkedList
//
//  Created by Anzeron on 2021/12/17.
//

#ifndef ListNode_hpp
#define ListNode_hpp

#include <iostream>

struct ListNode {
     int val;
     ListNode *next;
     ListNode(int x) : val(x), next(nullptr) {}
};

ListNode* create(int arr[], int n);
void print(ListNode* head);
void clean(ListNode* head);

void testListNode();



#endif /* ListNode_hpp */
