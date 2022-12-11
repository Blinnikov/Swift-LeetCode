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
    private var sum = Int.min

    func maxPathSum(_ root: TreeNode?) -> Int {
        traverse(root)
        return sum
    }

    private func traverse(_ node: TreeNode?) -> Int {
        guard let node = node else {
            return 0
        }

        let leftSum = max(traverse(node.left), 0)
        let rightSum = max(traverse(node.right), 0)

        sum = max(sum, leftSum + rightSum + node.val)

        return max(node.val + leftSum, node.val + rightSum)
    }
}
