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
    private var values = [Int]()

    func recoverTree(_ root: TreeNode?) {
        flatten(root)
        let sortedValues = values.sorted()
        var first = -1
        var second = -1

        for i in 0..<sortedValues.count {
            if values[i] != sortedValues[i] {
                if first == -1 {
                    first = values[i]
                } else if second == -1 {
                    second = values[i]
                }
            }
        }

        update(root, first, second)
    }

    private func flatten(_ node: TreeNode?) {
        guard let node = node else {
            return
        }

        flatten(node.left)
        values.append(node.val)
        flatten(node.right)
    }

    private func update(_ node: TreeNode?, _ first: Int, _ second: Int) {
        guard let node = node else {
            return
        }

        update(node.left, first, second)
        if node.val == first {
            node.val = second
        } else if node.val == second {
            node.val = first
        }
        update(node.right, first, second)
    }
}
