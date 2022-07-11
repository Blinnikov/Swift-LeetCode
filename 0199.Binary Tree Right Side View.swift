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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        if root == nil {
            return result
        }
        
        var queue = [TreeNode]()
        queue.insert(root!, at: 0)
        
        while !queue.isEmpty {
            var count = queue.count
            var levelSubResult = [Int]()
            
            while count > 0 {
                let item = queue.removeLast()
                
                if let left = item.left {
                    queue.insert(left, at: 0)
                }
                
                if let right = item.right {
                    queue.insert(right, at: 0)
                }
                
                count -= 1
                
                if count == 0 {
                    result.append(item.val)
                }
            }
        }
        
        return result
    }
}
