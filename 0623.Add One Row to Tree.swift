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
    func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
        if depth == 1 {
            return TreeNode(val, root, nil)
        }
        
        guard let root = root else {
            return nil
        }
        
        traverse(root, root.left, true, val, depth, 1)
        traverse(root, root.right, false, val, depth, 1)
        
        return root
    }
    
    private func traverse(_ prev: TreeNode, _ node: TreeNode?, _ isLeft: Bool, _ val: Int, _ depth: Int, _ curDepth: Int) {
        if curDepth == depth - 1 {
            var res = TreeNode(val)
            if isLeft {
                res.left = prev.left
                prev.left = res
            } else {
                res.right = prev.right
                prev.right = res
            }
            return
        }
        
        if let node = node {
            traverse(node, node.left, true, val, depth, curDepth + 1)
            traverse(node, node.right, false, val, depth, curDepth + 1)
        }
    }
}
