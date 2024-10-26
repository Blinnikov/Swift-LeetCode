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
    private var heights = Array(repeating: 0, count: 100_001)
    private var maxHeight = 0

    func treeQueries(_ root: TreeNode?, _ queries: [Int]) -> [Int] {
        traverseLeft(root, 0)

        maxHeight = 0

        traverseRight(root, 0)

        var res = Array(repeating: 0, count: queries.count)

        for i in 0..<queries.count {
            res[i] = heights[queries[i]]
        }

        return res
    }

    private func traverseLeft(_ node: TreeNode?, _ height: Int) {
        guard let node = node else {
            return
        }

        heights[node.val] = maxHeight

        maxHeight = max(maxHeight, height)

        traverseLeft(node.left, height + 1)
        traverseLeft(node.right, height + 1)
    }

    private func traverseRight(_ node: TreeNode?, _ height: Int) {
        guard let node = node else {
            return
        }

        heights[node.val] = max(heights[node.val], maxHeight) 

        maxHeight = max(maxHeight, height)

        traverseRight(node.right, height + 1)
        traverseRight(node.left, height + 1)
    }
}
