/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        let nonExistVal = 100001
        
        var pointerA = headA
        while pointerA != nil {
            pointerA?.val += nonExistVal
            pointerA = pointerA?.next
        }
        
        var pointerB = headB
        var result: ListNode?
        while pointerB != nil {
            if let b = pointerB, b.val > nonExistVal {
                result = pointerB
                break
            }
            pointerB = pointerB?.next
        }
        
        // revert list back
        pointerA = headA
        while pointerA != nil {
            pointerA?.val -= nonExistVal
            pointerA = pointerA?.next
        }
        
        return result
    }
}
