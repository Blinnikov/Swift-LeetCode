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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.isEmpty {
            return nil
        }

        var arr = [Int]()

        for list in lists {
            arr += toArray(list)
        }

        arr.sort()

        return toList(arr)
    }

    private func toArray(_ node: ListNode?) -> [Int] {
        var result = [Int]()

        var pointer = node
        while pointer != nil {
            result.append(pointer!.val)
            pointer = pointer!.next
        }

        return result
    }

    private func toList(_ arr: [Int]) -> ListNode? {
        var head = ListNode()
        var pointer = head

        for el in arr {
            var node = ListNode(el)
            pointer.next = node
            pointer = pointer.next!
        }

        return head.next
    }
}
