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
    func generateTrees(_ n: Int) -> [TreeNode?] {
        generate(from: 1, to: n)
    }

    private func generate(from: Int, to: Int) -> [TreeNode?] {
        var res = [TreeNode?]()

        if from > to {
            res.append(nil)
            return res
        }

        for i in from...to {
            let left = generate(from: from, to: i - 1)
            let right = generate(from: i + 1, to: to)

            for l in left {
                for r in right {
                    var node = TreeNode(i)
                    node.left = l
                    node.right = r

                    res.append(node)
                }
            }
        }

        return res
    }
}
