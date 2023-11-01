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
    var map = [Int:Int]()

    func findMode(_ root: TreeNode?) -> [Int] {
        traverse(root!)

        let maxCount = map.max { $0.value < $1.value }!.value

        var result = [Int]()

        for (k, v) in map {
            if v == maxCount {
                result.append(k)
            }
        }

        return result
    }

    private func traverse(_ node: TreeNode) {
        map[node.val, default: 0] += 1

        if let left = node.left {
            traverse(left)
        }

        if let right = node.right {
            traverse(right)
        }
    }
}
