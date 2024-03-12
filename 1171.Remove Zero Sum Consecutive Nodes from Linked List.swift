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
    func removeZeroSumSublists(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }

        var head = head
        var cur = head
        var sum = 0

        while cur != nil {
            sum += cur!.val

            if sum == 0 {
                head = cur!.next
                
                return removeZeroSumSublists(head)
            }

            cur = cur!.next
        }

        head!.next = removeZeroSumSublists(head!.next)

        return head
    }
}
