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
    func allPossibleFBT(_ n: Int) -> [TreeNode?] {
        var res = [TreeNode]()

        if n == 1 {
            return [TreeNode(0)]
        }

        var n = n - 1

        for i in stride(from: 1, to: n, by: 2) {
            let left = allPossibleFBT(i)
            let right = allPossibleFBT(n - i)

            for l in left {
                for r in right {
                    var node = TreeNode(0)
                    node.left = l
                    node.right = r

                    res.append(node)
                }
            }
        }

        return res
    }
}
