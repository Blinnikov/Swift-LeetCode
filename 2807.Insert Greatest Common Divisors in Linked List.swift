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
    func insertGreatestCommonDivisors(_ head: ListNode?) -> ListNode? {
        if head?.next == nil {
            return head
        }

        var curr = head
        var next = head?.next

        while next != nil {
            let gcd = gcd(curr!.val, next!.val)
            let node = ListNode(gcd)

            curr!.next = node
            node.next = next

            curr = next
            next = next?.next
        }

        return head        
    }

    private func gcd(_ a: Int, _ b: Int) -> Int {
        var b = b, a = a

        while b != 0 {
            let tmp = b
            b = a % b
            a = tmp
        }

        return a
    }
}
