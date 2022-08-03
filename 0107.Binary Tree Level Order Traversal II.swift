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
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        
        if root == nil {
            return result
        }
        
        var queue = [TreeNode]()
        queue.append(root!)
        
        while queue.count != 0 {
            var count = queue.count
            var subResult = [Int]()
            
            while count > 0 {
                let node = queue.removeLast()
                subResult.append(node.val)
                
                if node.left != nil {
                    queue.insert(node.left!, at: 0)
                }
                
                if node.right != nil {
                    queue.insert(node.right!, at: 0)
                }
                
                count -= 1
            }
            
            result.insert(subResult, at: 0)
        }
        
        return result
    }
}
