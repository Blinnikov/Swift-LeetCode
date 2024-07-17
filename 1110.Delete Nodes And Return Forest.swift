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
    private var res = [Int:TreeNode?]()

    func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
        var s = Set(to_delete)

        res[root!.val] = root

        traverse(root, nil, false, &s)

        return Array(res.values)
    }

    private func traverse(_ node: TreeNode?, _ parent: TreeNode?, _ isLeft: Bool, _ values: inout Set<Int>) {
        guard let node = node else {
            return
        }

        traverse(node.left, node, true, &values)
        traverse(node.right, node, false, &values)

        if !values.contains(node.val) {
            return
        }

        if res[node.val] != nil {
            res[node.val] = nil
        }

        if let p = parent {
            if isLeft {
                p.left = nil
            } else {
                p.right = nil
            }
        }

        if node.left != nil {
            res[node.left!.val] = node.left
        }

        if node.right != nil {
            res[node.right!.val] = node.right
        }
    }
}
