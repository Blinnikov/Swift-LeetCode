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
    private let mod = 1000000007

    private var sumOfTreeNodes = 0
    private var res = 0

    func maxProduct(_ root: TreeNode?) -> Int {
        traverseToSumUpTreeNodes(root)
        traverseToFindMaxProduct(root)

        return res % mod
    }

    private func traverseToSumUpTreeNodes(_ node: TreeNode?) {
        guard let node = node else {
            return
        }

        sumOfTreeNodes += node.val
        traverseToSumUpTreeNodes(node.left)
        traverseToSumUpTreeNodes(node.right)
    }

    private func traverseToFindMaxProduct(_ node: TreeNode?) -> Int {
        guard let node = node else {
            return 0
        }

        let left = traverseToFindMaxProduct(node.left)
        let right = traverseToFindMaxProduct(node.right)
        let sumOfSubtree = left + right + node.val
        let sumOfAnotherSubtree = sumOfTreeNodes - sumOfSubtree
        let product = sumOfSubtree * sumOfAnotherSubtree
        res = max(res, product)
        return sumOfSubtree
    }
}
