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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let node = root else {
            return true
        }
        
        return checkSubTrees(node.left, node.right)
    }
    
    private func checkSubTrees(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        
        if (left == nil && right != nil) || (left != nil && right == nil) {
            return false
        }
        
        return left!.val == right!.val && checkSubTrees(left!.left, right!.right) && checkSubTrees(left!.right, right!.left)
    }
}
