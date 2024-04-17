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
    private let a = 97

    func smallestFromLeaf(_ root: TreeNode?) -> String {
        if root == nil {
            return ""
        }

        return traverse(root!, [Character]())
    }

    private func traverse(_ node: TreeNode, _ chars: [Character]) -> String {
        let ch = intToChar(node.val)
        var newChars = [ch] + chars

        if node.left == nil, node.right == nil {
            return String(newChars)
        }

        if node.left == nil, node.right != nil {
            return traverse(node.right!, newChars)
        }

        if node.left != nil, node.right == nil {
            return traverse(node.left!, newChars)
        }

        let left = traverse(node.left!, newChars)
        let right = traverse(node.right!, newChars)

        return left < right ? left : right
    }

    private func intToChar(_ num: Int) -> Character {
        Character(UnicodeScalar(a + num)!)
    }
}
