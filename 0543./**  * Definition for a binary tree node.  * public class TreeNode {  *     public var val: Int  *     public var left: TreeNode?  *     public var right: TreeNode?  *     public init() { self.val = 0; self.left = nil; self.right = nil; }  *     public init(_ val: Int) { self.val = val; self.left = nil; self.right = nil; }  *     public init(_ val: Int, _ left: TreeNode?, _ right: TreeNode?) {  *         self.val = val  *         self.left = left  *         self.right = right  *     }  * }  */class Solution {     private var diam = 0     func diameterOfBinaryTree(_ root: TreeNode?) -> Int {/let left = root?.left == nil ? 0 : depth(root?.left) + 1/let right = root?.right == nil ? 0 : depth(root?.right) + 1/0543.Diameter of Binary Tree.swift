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
    private var diam = 0
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        // let left = root?.left == nil ? 0 : depth(root?.left) + 1
        // let right = root?.right == nil ? 0 : depth(root?.right) + 1
        // return left + right
        depth(root)
        return diam
    }
    
    private func depth(_ node: TreeNode?) -> Int {
        guard let node = node else {
            return 0
        }
        
        if node.left == nil && node.right == nil {
            return 0
        }
        
        let lDepth = depth(node.left)
        let rDepth = depth(node.right)
        let left = node.left == nil ? 0 : lDepth + 1
        let right = node.right == nil ? 0 : rDepth + 1
        
        diam = max(diam, left + right)
        
        return max(lDepth, rDepth) + 1
    }
}
