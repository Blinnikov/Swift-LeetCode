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
    func kthLargestLevelSum(_ root: TreeNode?, _ k: Int) -> Int {
        var sums = [Int]()

        var queue = [TreeNode]()
        queue.append(root!)

        while !queue.isEmpty {
            let count = queue.count
            var sum = 0

            for i in 0..<count {
                let node = queue.removeLast()
                sum += node.val

                if node.left != nil {
                    queue.insert(node.left!, at: 0)
                }

                if node.right != nil {
                    queue.insert(node.right!, at: 0)
                }
            }

            sums.append(sum)
        }

        if sums.count < k {
            return -1
        }

        sums.sort()
        
        return sums[sums.count - k]
    }
}
