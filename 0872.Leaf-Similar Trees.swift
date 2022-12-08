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
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        guard let r1 = root1, let r2 = root2 else {
            return false
        }

        var left = [Int](), right = [Int]()
        traverse(r1, &left)
        traverse(r2, &right)

        return left == right
    }

    private func traverse(_ node: TreeNode, _ seq: inout [Int]) {
        if node.left == nil, node.right == nil {
            seq.append(node.val)
            return
        }

        if node.left != nil {
            traverse(node.left!, &seq)
        }

        if node.right != nil {
            traverse(node.right!, &seq)
        }
    }
}
