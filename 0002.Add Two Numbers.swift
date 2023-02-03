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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        return sum(l1, l2, 0)
    }
    
    private func sum(_ l1: ListNode?, _ l2: ListNode?, _ extra: Int) -> ListNode? {
        if l1 == nil && l2 == nil {
            return extra == 1 ? ListNode(1) : nil
        }
        
        let nodeVal = (l1?.val ?? 0) + (l2?.val ?? 0) + extra
        if nodeVal >= 10 {
            return ListNode(nodeVal-10, sum(l1?.next, l2?.next, 1))
        } else {
            return ListNode(nodeVal, sum(l1?.next, l2?.next, 0))
        }
    }
}
