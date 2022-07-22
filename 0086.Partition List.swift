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
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var p = head
        var arr = [Int]()
        
        while p != nil {
            if p!.val < x {
                arr.append(p!.val)
            }
            p = p!.next
        }
        
        p = head
        
        while p != nil {
            if p!.val >= x {
                arr.append(p!.val)
            }
            p = p!.next
        }
        
        var newHead: ListNode? = ListNode()
        p = newHead
        
        for i in 0..<arr.count {
            let node = ListNode(arr[i])
            p!.next = node
            p = p!.next
        }
        
        return newHead!.next
    }
}
