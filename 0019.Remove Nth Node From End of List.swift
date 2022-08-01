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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        var pointer = head
        var length = 1
        
        while pointer!.next != nil {
            pointer = pointer!.next
            length += 1
        }
        
        let nodeBeforeRemoved = length - n
        
        if nodeBeforeRemoved == 0 {
            return head?.next
        }
        
        var counter = 1
        pointer = head
        
        while counter < nodeBeforeRemoved {
            pointer = pointer!.next
            counter += 1
        }
        
        pointer!.next = pointer?.next?.next
        
        return head
    }
}
