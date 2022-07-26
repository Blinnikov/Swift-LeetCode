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
    private var lca: TreeNode? = nil
    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {        
        walkTree(root, p!.val, q!.val)
        return lca;
    }
    
    private func walkTree(_ node: TreeNode?, _ p: Int, _ q: Int) -> Bool {
        if node == nil {
            return false
        }
        
        let isInLeft = walkTree(node!.left, p, q) ? 1 : 0
        let isInRight = walkTree(node!.right, p, q) ? 1 : 0
        let isInRoot = node!.val == p || node!.val == q ? 1 : 0
        
        let sum = isInLeft + isInRight + isInRoot
        if(sum >= 2) {
            lca = node
        }
        
        return sum > 0
    }
}
