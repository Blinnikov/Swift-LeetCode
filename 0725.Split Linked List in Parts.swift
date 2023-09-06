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
    func splitListToParts(_ head: ListNode?, _ k: Int) -> [ListNode?] {
        var res: [ListNode?] = Array(repeating: nil, count: k)

        var count = 0
        var pointer = head

        while pointer != nil {
            count += 1
            pointer = pointer!.next
        }

        let itemsInGroup = count / k
        var extraItems = count % k

        pointer = head
        var prev: ListNode? = nil
        var idx = 0

        while idx < k, pointer != nil {
            res[idx] = pointer!

            for i in 0..<(itemsInGroup + (extraItems > 0 ? 1 : 0)) {
                prev = pointer
                pointer = pointer?.next
            }

            prev?.next = nil

            idx += 1
            extraItems -= 1
        }

        return res
    }
}
