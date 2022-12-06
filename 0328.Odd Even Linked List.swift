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
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        if head!.next == nil {
            return head
        }
        
        var oddHead: ListNode? = nil
        var oddTail: ListNode? = nil
        var evenHead: ListNode? = nil
        var evenTail: ListNode? = nil
        
        var cur = head
        var counter = 1
        
        while cur != nil {
            if counter % 2 == 0 {
                if evenHead == nil {
                    evenHead = cur
                    evenTail = cur
                } else {
                    evenTail!.next = cur
                    evenTail = cur
                }
                if let oddTail = oddTail {
                    oddTail.next = cur!.next
                    cur = cur!.next
                    evenTail!.next = nil
                }
            } else {
               if oddHead == nil {
                    oddHead = cur
                    oddTail = cur
                } 
                else {
                    oddTail!.next = cur
                    oddTail = cur
                }
                cur = cur!.next
            }
            
            counter += 1
        }
        
        if let oddTail = oddTail {
            oddTail.next = evenHead
            return oddHead
        }
        
        return evenHead
    }
}
