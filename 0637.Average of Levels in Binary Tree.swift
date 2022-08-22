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
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        guard let root = root else {
            return [0.0]
        }
        
        var queue = [TreeNode]()
        queue.append(root)
        
        var result = [Double]()
        
        while !queue.isEmpty {
            let count = Double(queue.count)
            var counter = queue.count
            var sum = 0.0
            while counter > 0 {
                let node = queue.removeLast()
                sum += Double(node.val)
                
                if node.left != nil {
                    queue.insert(node.left!, at: 0)
                }
                
                if node.right != nil {
                    queue.insert(node.right!, at: 0)
                }
                
                counter -= 1
            }
            
            var avg = sum / count
            result.append(avg)
        }
        
        return result
    }
}
