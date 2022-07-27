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
    func flatten(_ root: TreeNode?) {
        recurse(root).head
    }
    
    private func recurse(_ node: TreeNode?) -> (head: TreeNode?, tail: TreeNode?) {
        if node == nil {
            return (nil, nil)
        }
        
        let left = recurse(node!.left)
        let right = recurse(node!.right)
        
        if left.head == nil && right.head == nil {
            return (node, node)
        }
        
        if left.head == nil && right.head != nil {
            node!.right = right.head
            return (node, right.tail)
        }
        
        if left.head != nil && right.head == nil {
            node!.left = nil
            node!.right = left.head
            return (node, left.tail)
        }
        
        node!.left = nil
        left.tail!.right = right.head
        node!.right = left.head
        
        // both don't equal nil
        return (node, right.tail)
    }
}
