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
    func doubleIt(_ head: ListNode?) -> ListNode? {
        var reversed = reverse(head)
        
        var curr = reversed
        var carry = 0
        var last: ListNode? = nil

        while curr != nil {
            var val = curr!.val * 2 + carry
            curr!.val = val % 10
            carry = val > 9 ? 1 : 0

            if curr!.next == nil {
                last = curr
            }

            curr = curr!.next
        }

        if carry == 1, last != nil {
            let fake = ListNode(1)

            last!.next = fake
        }

        return reverse(reversed)
    }

    private func reverse(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var curr = head

        while curr != nil {
            let next = curr!.next // 8 9 nil
            curr!.next = prev // nil 1 8
            prev = curr // 1 8 9
            curr = next // 8 9 nil
        }

        return prev
    }
}
