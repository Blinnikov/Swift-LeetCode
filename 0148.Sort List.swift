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
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var arr = [Int]()
        var cur = head
        while cur != nil {
            arr.append(cur!.val)
            cur = cur!.next
        }
        
        arr.sort()
        
        // print(arr)
        
        var newHead = ListNode(arr[0])
        var prev = newHead
        for i in 1..<arr.count {
            let node = ListNode(arr[i])
            prev.next = node
            prev = node
        }
        
        return newHead
    }
}
