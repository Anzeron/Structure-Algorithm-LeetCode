//
//  ListNode.swift
//  03-LinkedList
//
//  Created by Anzeron on 2021/12/21.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func create(_ arr: [Int]) -> ListNode? {
    let dummyHead = ListNode(-1)
    var last = dummyHead
    
    for num in arr {
        let node = ListNode(num)
        last.next = node
        
        last = node
    }
    
    return dummyHead.next
}

func print(_ head: ListNode?) -> Void {
    
    var node = head
    var text = ""
    while node != nil {
        text = text + "\(node!.val)" + " -> "
        
        node = node?.next
    }
    
    text = text + "nil"
    
    print(text)
}

func testListNode() -> Void {
    let head = create([1,2,3,4,5])
    print(head)
    
}
