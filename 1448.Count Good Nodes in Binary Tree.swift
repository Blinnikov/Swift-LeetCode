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
    
    private let minVal = -10001
    private var counter = 0
    
    func goodNodes(_ root: TreeNode?) -> Int {
        traverse(root, minVal)
        return counter
    }
    
    private func traverse(_ node: TreeNode?, _ prev: Int) {
        guard let node = node else {
            return
        }
        
        if node.val >= prev {
            counter += 1
        }
        
        traverse(node.left, max(node.val, prev))
        traverse(node.right, max(node.val, prev))
    }
}
