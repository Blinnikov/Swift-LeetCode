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
    private let _max = 2147483647 + 1
    private let _min = -2147483648 - 1
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        return check(root, _min, _max)
    }
    
    private func check(_ node: TreeNode?, _ _min: Int, _ _max: Int) -> Bool {
        guard let node = node else {
            return true
        }
        
        if node.val <= _min || node.val >= _max {
            return false
        }
        
        if let left = node.left, left.val >= node.val {
            return false
        }
        
        if let right = node.right, right.val <= node.val {
            return false
        }
        
        return check(node.left, _min, node.val) && check(node.right, node.val, _max)
    }
}
