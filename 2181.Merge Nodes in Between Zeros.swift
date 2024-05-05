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
    func mergeNodes(_ head: ListNode?) -> ListNode? {
        // toList(toArray(head))
        v2(head)
    }

    private func toArray(_ node: ListNode?) -> [Int] {
        var node = node
        var res = [Int]()

        var val = 0

        while node != nil {
            if node!.val == 0 {
                if val != 0 {
                    res.append(val)
                    val = 0
                }
            } else {
                val += node!.val
            }
            node = node!.next
        }

        return res
    }

    private func toList(_ arr: [Int]) -> ListNode? {
        var head: ListNode? = nil
        var node: ListNode? = nil

        for el in arr {
            if head == nil {
                head = ListNode(el)
                node = head
            } else {
                let tmp = ListNode(el)
                node!.next = tmp
                node = node!.next
            }
        }

        return head
    }

    private func v2(_ node: ListNode?) -> ListNode? {
        var node = node
        var head: ListNode? = nil
        var curr: ListNode? = nil
        var val = 0

        while node != nil {
            if node!.val == 0 {
                if val != 0 {
                    if head == nil {
                        head = ListNode(val)
                        curr = head
                    } else {
                        let tmp = ListNode(val)
                        curr!.next = tmp
                        curr = curr!.next
                    }
                    val = 0
                }
            } else {
                val += node!.val
            }
            node = node!.next
        }

        return head
    }
}
