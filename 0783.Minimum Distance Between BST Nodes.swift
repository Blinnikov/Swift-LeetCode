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
    private var values = [Int]()

    func minDiffInBST(_ root: TreeNode?) -> Int {
        traverse(root)
        var res = Int.max

        for i in 1..<values.count {
            res = min(res, abs(values[i] - values[i - 1]))
        }

        return res
    }

    private func traverse(_ node: TreeNode?) {
        if let node = node {
            traverse(node.left)
            values.append(node.val)
            traverse(node.right)
        }
    }
}
