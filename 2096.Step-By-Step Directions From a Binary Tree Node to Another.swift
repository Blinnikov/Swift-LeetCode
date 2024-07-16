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
    func getDirections(_ root: TreeNode?, _ startValue: Int, _ destValue: Int) -> String {
        var pathToStart = [Character]()
        var pathToDest = [Character]()

        traverse(root!, startValue, &pathToStart)
        traverse(root!, destValue, &pathToDest)

        var depth = 0
        var maxDepth = min(pathToStart.count, pathToDest.count)

        while depth < maxDepth, 
            pathToStart[pathToStart.count - depth - 1] == pathToDest[pathToDest.count - depth - 1] {
            depth += 1
        }

        var res = Array(repeating: Character("U"), count: pathToStart.count - depth)

        res = res + pathToDest.reversed()[depth...]

        return String(res)
    }

    private func traverse(_ node: TreeNode, _ val: Int, _ path: inout[Character]) -> Bool {
        if node.val == val {
            return true
        }

        if let left = node.left, traverse(left, val, &path) {
            path.append(Character("L"))
        } else if let right = node.right, traverse(right, val, &path) {
            path.append(Character("R"))
        }

        return path.count > 0
    }
}
