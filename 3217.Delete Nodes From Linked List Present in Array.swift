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
    func modifiedList(_ nums: [Int], _ head: ListNode?) -> ListNode? {
        let s = Set(nums)
        var fake: ListNode? = ListNode(0, head)

        var p = fake

        while p?.next != nil {
            if s.contains(p!.next!.val) {
                p!.next = p!.next!.next
                continue
            }

            p = p?.next
        }

        return fake?.next
    }
}
