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
    func sumEvenGrandparent(_ root: TreeNode?) -> Int {
        traverse(root, nil, nil)
    }
    
    private func traverse(_ node: TreeNode?, _ parent: TreeNode?, _ grandparent: TreeNode?) -> Int {
        guard let node = node else {
            return 0
        }
        
        return value(of: node, with: grandparent)
            + traverse(node.left, node, parent)
            + traverse(node.right, node, parent)
    }
    
    private func value(of node: TreeNode, with grandparent: TreeNode?) -> Int {
        guard let gp = grandparent else {
            return 0
        }
        
        if gp.val % 2 == 0 {
            return node.val
        }
        
        return 0
    }
}
