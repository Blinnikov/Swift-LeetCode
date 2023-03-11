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
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    private(set) var _nums = [Int]()

    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        var pointer = head
        while pointer != nil {
            _nums.append(pointer!.val)
            pointer = pointer!.next
        }

        return transform(0, _nums.count - 1)
    }
    
    private func transform(_ s: Int, _ e: Int) -> TreeNode? {
        if e < s {
            return nil
        }

        if s == e {
            return TreeNode(_nums[s])
        }
        
        let mid = s + (e - s + 1) / 2
        return TreeNode(_nums[mid], transform(s, mid - 1), transform(mid + 1, e))
    }
}
