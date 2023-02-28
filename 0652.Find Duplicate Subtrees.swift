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
    private var map = [String:Int]()
    private var nodes = [TreeNode?]()

    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        traverse(root)
        return nodes    
    }

    private func traverse(_ node: TreeNode?) -> String {
        if node == nil {
            return "<nil>"
        }

        var serialized = "\(node!.val)|\(traverse(node!.left))|\(traverse(node!.right))";
        map[serialized, default: 0] += 1
        if map[serialized] == 2 {
            nodes.append(node)
        }

        return serialized
    }
}
