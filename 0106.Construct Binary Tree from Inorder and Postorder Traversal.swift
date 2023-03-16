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
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var map = [Int:Int]()
        
        for i in 0..<inorder.count {
            map[inorder[i]] = i
        }

        return buildRecursively(inorder, 0, inorder.count - 1, postorder, 0, postorder.count - 1, map)
    }

    private func buildRecursively(
        _ inorder: [Int], _ inorderStartIdx: Int, _ inorderEndIdx: Int,
        _ postorder: [Int], _ postorderStartIdx: Int, _ postorderEndIdx: Int,
        _ indicesMap: [Int:Int]
    ) -> TreeNode? {

        if postorderStartIdx > postorderEndIdx || inorderStartIdx > inorderEndIdx {
            return nil
        }

        let val = postorder[postorderEndIdx]
        let node = TreeNode(val)
        let splitIdx = indicesMap[val]!

        node.left = buildRecursively(
            inorder, inorderStartIdx, splitIdx - 1,
            postorder, postorderStartIdx, postorderStartIdx + splitIdx - inorderStartIdx - 1,
            indicesMap
        )

        node.right = buildRecursively(
            inorder, splitIdx + 1, inorderEndIdx,
            postorder, postorderStartIdx + splitIdx - inorderStartIdx, postorderEndIdx - 1,
            indicesMap
        )

        return node
    }
}
