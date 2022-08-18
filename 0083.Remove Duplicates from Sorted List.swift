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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var prev: ListNode = head!
        var cur = head
        var seen = [Int:Bool]()
        
        while cur != nil {
            if seen[cur!.val] == nil {
                seen[cur!.val] = true
                prev = cur!
                cur = cur!.next
            } else {
                prev.next = cur!.next
                cur = cur!.next
            }
        }
        
        return head
    }
}
