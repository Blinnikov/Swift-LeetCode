/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        return reverseListRecursively(head, nil)
    }
    
    private func reverseListRecursively(_ head: ListNode?, _ prev: ListNode?) -> ListNode? {
        if head == nil {
            return prev
        }
        
        let temp = head!.next
        head!.next = prev
        return reverseListRecursively(temp, head)
    }
    
    // Runtime - 28 ms
    func reverseListRecursively_v1(_ head: ListNode?, _ prevNode: ListNode?) -> ListNode? {
        if(head == nil) {
            return prevNode
        }
        
        let nextNode = head?.next
        head?.next = prevNode
        return reverseListRecursively(nextNode, head)
    }
    
    // Extra function call (instead of code inlining) loses 
    // in Runtime - 16ms vs. 7ms
    func reverseListIteratively(_ head: ListNode?) -> ListNode? {
        if(head == nil) {
            return nil
        }
        
        var currentNode = head;
        var prevNode: ListNode? = nil;
        var tempNode: ListNode? = nil;
        
        while(currentNode != nil) {
            tempNode = currentNode?.next;
            currentNode?.next = prevNode;
            prevNode = currentNode;
            currentNode = tempNode;
        }
        
        return prevNode;
    }
}
