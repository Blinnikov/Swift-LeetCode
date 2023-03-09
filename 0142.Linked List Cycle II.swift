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
    private let nonExistVal = 100001
    
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil {
            return false
        }
        
        var curr: ListNode? = head
        while curr != nil && curr!.val != nonExistVal {
            curr!.val = nonExistVal
            curr = curr!.next
        }
        
        return curr != nil
    }
}
