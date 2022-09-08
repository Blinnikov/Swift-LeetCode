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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        // recursive
        // return inorderTraversal(root.left) + [root.val] + inorderTraversal(root.right)
        
        var result = [Int]()
        var stack = [TreeNode?]()
        var current: TreeNode? = root
        
        while(!stack.isEmpty || current != nil) {
            if let curr = current {
                stack.append(curr)
                current = curr.left
            } else {
                current = stack.removeLast()!
                result.append(current!.val)
                current = current!.right
            }
        }
        
        return result
    }
}
