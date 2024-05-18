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
    var res = 0

    func distributeCoins(_ root: TreeNode?) -> Int {
        traverse(root)

        return res    
    }

    func traverse(_ node: TreeNode?) -> Int {
        guard let node = node else {
            return 0
        }

        var left = traverse(node.left)
        var right = traverse(node.right)

        res += (abs(left) + abs(right))

        return node.val - 1 + left + right
    }
}
