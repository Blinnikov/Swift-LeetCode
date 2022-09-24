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
    
    private var res = [String]()
    
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let root = root else {
            return res
        }
        
        traverse(root, "")
        return res
    }
    
    private func traverse(_ node: TreeNode, _ path: String) {
        var path = path == "" ? "\(node.val)" : "\(path)->\(node.val)"
        if node.left == nil && node.right == nil {
            res.append(path)
        }
        
        if let left = node.left {
            traverse(left, path)
        }
        
        if let right = node.right {
            traverse(right, path)
        }
    }
}
