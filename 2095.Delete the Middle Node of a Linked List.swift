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
    func deleteMiddle(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        var len = 0
        var pointer: ListNode? = head
        while pointer != nil {
            len += 1
            pointer = pointer!.next
        }
        
        if len == 1 {
            return head.next
        }
        
        if len == 2 {
            head.next = nil
            return head
        }
        
        let mid = len / 2
        var counter = 0
        pointer = head
        
        while counter != mid - 1 {
            counter += 1
            pointer = pointer!.next
        }
        
        let midNext = pointer!.next?.next
        pointer!.next = midNext
        
        return head
    }
}
