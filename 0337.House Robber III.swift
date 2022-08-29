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
    func rob(_ root: TreeNode?) -> Int {
        let values = traverse(root)
        return max(values.0, values.1)
    }
    
    private func traverse(_ node: TreeNode?) -> (Int,Int) {
        guard let node = node else {
            return (0,0)
        }
        
        let left = traverse(node.left)
        let right = traverse(node.right)
        let maxValWithoutCurrentNode = max(left.0, left.1) + max(right.0, right.1)
        let maxValWithCurrentNode = left.0 + right.0 + node.val
        return (maxValWithoutCurrentNode, maxValWithCurrentNode)
    }
}
