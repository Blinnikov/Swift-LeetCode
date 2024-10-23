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
    func replaceValueInTree(_ root: TreeNode?) -> TreeNode? {
        guard var root = root else {
            return nil
        }

        var q = [TreeNode]()
        q.append(root)

        var sums = [Int]()

        while !q.isEmpty {
            var sum = 0
            var count = q.count

            while count > 0 {
                let n = q.removeLast()

                sum += n.val

                if let left = n.left {
                    q.insert(left, at: 0)
                }

                if let right = n.right {
                    q.insert(right, at: 0)
                }

                count -= 1
            }

            sums.append(sum)
        }

        q.append(root)
        root.val = 0

        var idx = 1

        while !q.isEmpty {
            var count = q.count

            while count > 0 {
                let n = q.removeLast()

                let sum = (n.left != nil ? n.left!.val : 0) + (n.right != nil ? n.right!.val : 0)

                if let left = n.left {
                    left.val = sums[idx] - sum

                    q.insert(left, at: 0)
                }

                if let right = n.right {
                    right.val = sums[idx] - sum

                    q.insert(right, at: 0)
                }

                count -= 1
            }

            idx += 1
        }

        return root
    }
}
