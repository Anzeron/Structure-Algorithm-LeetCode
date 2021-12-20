//
//  ListNode.cpp
//  03-LinkedList
//
//  Created by Anzeron on 2021/12/17.
//

#include "ListNode.hpp"

using namespace std;

ListNode* create(int arr[], int n) {

    ListNode* head = new ListNode(arr[0]);
    ListNode* node = head;
    for(int i = 1 ; i < n ; i++){
        node->next = new ListNode(arr[i]);
        node = node->next;
    }

    return head;
}

// 打印以head为头结点的链表信息内容
void print(ListNode* head) {

    ListNode* curNode = head;
    while(curNode != NULL){
        cout << curNode->val << " -> ";
        curNode = curNode->next;
    }

    cout << "NULL" << endl;

    return;
}

// 释放以head为头结点的链表空间
void clean(ListNode* head) {

    ListNode* curNode = head;
    while(curNode != NULL){
        ListNode* delNode = curNode;
        curNode = curNode->next;
        delete delNode;
    }

    return;
}

void testListNode() {
    int arr[] = {1,2,3,5};
    ListNode *h = create(arr,4);
    print(h);
    clean(h);
}
