/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if let root = root, let p = p, let q = q {
            if p.val == root.val || q.val == root.val {
                return root
            }
            
            if (p.val < root.val && q.val > root.val) || (q.val < root.val && p.val > root.val) {
                return root
            }
            
            if p.val < root.val && q.val < root.val {
                return lowestCommonAncestor(root.left, p, q)
            }
            
            return lowestCommonAncestor(root.right, p, q)
            
        } else {
            return nil
        }
    }
}
