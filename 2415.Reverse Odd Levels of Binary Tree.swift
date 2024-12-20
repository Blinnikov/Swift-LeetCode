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
    func reverseOddLevels(_ root: TreeNode?) -> TreeNode? {
        var root = root

        traverse(root?.left, root?.right, 0)

        return root
    }

    private func traverse(_ left: TreeNode?, _ right: TreeNode?, _ level: Int) {
        if left == nil || right == nil {
            return
        }

        if level % 2 == 0 {
            let tmp = left!.val
            left!.val = right!.val
            right!.val = tmp
        }

        traverse(left!.left, right!.right, level + 1)
        traverse(left!.right, right!.left, level + 1)
    }
}
