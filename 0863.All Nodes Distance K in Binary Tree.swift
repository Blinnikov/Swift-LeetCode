/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    private var map = [Int:Int]()
    private var res = [Int]()

    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
        fillDistances(root, target!.val)

        print(map)

        traverse(root, k, map[root!.val]!)

        return res
    }

    private func fillDistances(_ node: TreeNode?, _ target: Int) -> Int {
        guard let node = node else {
            return -1
        }

        if node.val == target {
            map[node.val] = 0
            return 0
        }

        let left = fillDistances(node.left, target)
        if left >= 0 {
            map[node.val] = left + 1
            return left + 1
        }

        let right = fillDistances(node.right, target)
        if right >= 0 {
            map[node.val] = right + 1
            return right + 1
        }

        return -1
    }

    private func traverse(_ node: TreeNode?, _ k: Int, _ distance: Int) {
        guard let node = node else {
            return
        }

        var distance = distance

        if let dist = map[node.val] {
            distance = dist
        }

        if distance == k {
            res.append(node.val)
        }

        traverse(node.left, k, distance + 1)
        traverse(node.right, k, distance + 1)
    }
}
