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
    private var arr = [Int]()

    func balanceBST(_ root: TreeNode?) -> TreeNode? {
        traverse(root)

        return toTree(0, arr.count - 1)
    }

    private func traverse(_ node: TreeNode?) {
        if node == nil {
            return
        }

        traverse(node!.left)
        
        arr.append(node!.val)

        traverse(node!.right)
    }

    private func toTree(_ lo: Int, _ hi: Int) -> TreeNode? {
        if lo > hi {
            return nil
        }

        if lo == hi {
            return TreeNode(arr[lo])
        }

        let mid = (lo + hi) / 2
        
        return TreeNode(arr[mid], toTree(lo, mid - 1), toTree(mid + 1, hi))
    }
}
