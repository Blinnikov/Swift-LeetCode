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
    func pairSum(_ head: ListNode?) -> Int {
        var arr = toArray(head)

        var res = 0

        for i in 0..<(arr.count / 2) {
            res = max(res, arr[i] + arr[arr.count - i - 1])
        }

        return res
    }

    private func toArray(_ node: ListNode?) -> [Int] {
        var res = [Int]()

        var pointer = node

        while pointer != nil {
            res.append(pointer!.val)
            pointer = pointer!.next
        }

        return res
    }
}
