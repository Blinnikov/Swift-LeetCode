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

    func maxAncestorDiff(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }

        recurse(root, root.val, root.val)
        return res
    }

    private func recurse(_ node: TreeNode?, _ minSoFar: Int, _ maxSoFar: Int) {
        guard let node = node else {
            return
        }

        let candidate = max(abs(node.val - minSoFar), abs(node.val - maxSoFar))
        res = max(res, candidate)
        let minSoFar = min(minSoFar, node.val)
        let maxSoFar = max(maxSoFar, node.val)

        recurse(node.left, minSoFar, maxSoFar)
        recurse(node.right, minSoFar, maxSoFar)
    }
}
