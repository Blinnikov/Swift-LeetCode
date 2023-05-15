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
    func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
        let arr = toArray(head, k)

        return toList(arr)

        return nil
    }

    private func toArray(_ node: ListNode?, _ k: Int) -> [Int] {
        var node = node
        var res = [Int]()
        res.reserveCapacity(100_000)

        while node != nil {
            res.append(node!.val)
            node = node!.next
        }

        let x1 = k - 1
        let x2 = res.count - k

        // print(res, x1, x2)

        res.swapAt(x1, x2)

        // print(res)

        return res
    }

    private func toList(_ arr: [Int]) -> ListNode? {
        var arr = arr
        var fakeNode = ListNode()
        var pointer: ListNode? = fakeNode

        for i in 0..<arr.count {
            let val = arr[i]
            var node = ListNode(val)
            pointer!.next = node
            pointer = pointer!.next
        }

        return fakeNode.next
    }
}
