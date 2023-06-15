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
    func maxLevelSum(_ root: TreeNode?) -> Int {
        var maxValue = Int.min
        var minLevel = 0

        var queue = [root!]

        var level = 0

        while !queue.isEmpty {
            var count = queue.count

            level += 1
            var levelSum = 0

            while count > 0 {
                let node = queue.removeLast()

                levelSum += node.val

                if let right = node.right {
                    queue.insert(right, at: 0)
                }

                if let left = node.left {
                    queue.insert(left, at: 0)
                }

                count -= 1
            }

            if levelSum > maxValue {
                maxValue = levelSum
                minLevel = level
            }
        }


        return minLevel
    }
}
