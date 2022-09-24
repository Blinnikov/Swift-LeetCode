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
    private var result = [[Int]]()
    
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        guard let root = root else {
            return result
        }
        traverse(root, [], targetSum)
        return result
    }
    
    private func traverse(_ node: TreeNode, _ subRes: [Int], _ sumLeft: Int) {
        var nextSubResult = subRes + [node.val]
        
        if node.left == nil && node.right == nil && node.val == sumLeft {
            result.append(nextSubResult)
            return
        }
        
        if node.left != nil {
            traverse(node.left!, nextSubResult, sumLeft - node.val)
        }
        
        if node.right != nil {
            traverse(node.right!, nextSubResult, sumLeft - node.val)
        }
    }
}
