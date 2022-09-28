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
    func getDecimalValue(_ head: ListNode?) -> Int {
        var size = 1
        var pointer = head!
        while pointer.next != nil {
            pointer = pointer.next!
            size += 1
        }
        
        pointer = head!
        var answer = 0
        for i in 1...size {
            if pointer.val == 1 {
                answer += pointer.val << (size-i)
            }
            if i != size {
                pointer = pointer.next!
            }
        }
        
        return answer
    }
}
