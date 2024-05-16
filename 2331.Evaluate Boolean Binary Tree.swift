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
    func evaluateTree(_ root: TreeNode?) -> Bool {
        guard let node = root else {
            return false
        }

        if node.val == 0 {
            return false
        }

        if node.val == 1 {
            return true
        }

        if node.val == 2 {
            return evaluateTree(node.left) || evaluateTree(node.right)
        }

        return evaluateTree(node.left) && evaluateTree(node.right)
    }
}
