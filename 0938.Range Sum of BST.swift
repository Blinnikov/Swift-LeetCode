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
    private var res = 0
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        traverse(root, low, high)
        return res
    }

    private func traverse(_ node: TreeNode?, _ lo: Int, _ hi: Int) {
        guard let node = node else {
            return
        }

        traverse(node.left, lo, hi)

        if node.val >= lo, node.val <= hi {
            res += node.val
        }

        traverse(node.right, lo, hi)
    }
}
