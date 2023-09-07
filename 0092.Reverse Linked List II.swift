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
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        var l = left
        var r = right

        var head = head
        var pointer = head
        var prev: ListNode? = nil

        while l > 1 {
            prev = pointer
            pointer = pointer?.next
            l -= 1
            r -= 1
        }

        var prevEnd = prev
        var tail = pointer

        var scanner: ListNode? = nil

        while r > 0 {
            scanner = pointer?.next
            pointer?.next = prev
            prev = pointer
            pointer = scanner

            r -= 1
        }

        if prevEnd != nil {
            prevEnd!.next = prev
        } else {
            head = prev
        }

        tail?.next = pointer

        return head
    }
}
