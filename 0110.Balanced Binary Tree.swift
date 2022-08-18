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
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        if root!.left == nil && root!.right == nil {
            return true
        }
        
        if root!.left == nil && root!.right != nil && root!.right!.left == nil && root!.right!.right == nil {
            return true
        }
        
        if root!.right == nil && root!.left != nil && root!.left!.left == nil && root!.left!.right == nil {
            return true
        }
        
        let leftHeight = height(root!.left)
        let rightHeight = height(root!.right)
        let diff = max(leftHeight, rightHeight) - min(leftHeight, rightHeight)
        
        return isBalanced(root!.left) && isBalanced(root!.right) && diff < 2
    }
    
    private func height(_ node: TreeNode?) -> Int {
        if node == nil {
            return 0
        }
        
        if node!.left == nil && node!.right == nil {
            return 1
        }
        
        return max(height(node!.left), height(node!.right)) + 1
    }
}
