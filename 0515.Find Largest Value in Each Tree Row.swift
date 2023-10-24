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
    func largestValues(_ root: TreeNode?) -> [Int] {
        var result = [Int]()

        if root == nil {
            return result
        }

        var queue = [TreeNode]()
        queue.append(root!)

        while !queue.isEmpty {
            var levelMax = Int.min
            var levelCount = queue.count

            while levelCount > 0 {
                let node = queue.removeLast()
                levelMax = max(levelMax, node.val)

                if let left = node.left {
                    queue.insert(left, at: 0)
                }

                if let right = node.right {
                    queue.insert(right, at: 0)
                }

                levelCount -= 1
            }

            result.append(levelMax)
        }

        return result
    }
}
