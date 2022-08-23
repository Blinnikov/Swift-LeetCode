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
    private var arr = [Int]()
    
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        guard let root = root else {
            return -1
        }
        
        traverse(root)
        
        return arr[k-1]
    }
    
    private func traverse(_ node: TreeNode) {
        if node.left == nil && node.right == nil {
            arr.append(node.val)
            return
        }
        
        if let left = node.left {
            traverse(left)
        }
        
        arr.append(node.val)
        
        if let right = node.right {
            traverse(right)
        }
    }
}
