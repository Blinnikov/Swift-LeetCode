// TLE 

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
    private var height = 0
    private var width = 0

    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        traverseToCalculateHeight(root, 0)

        // print(height)

        getLastLevel(root)

        // print(width)

        return width
    }

    private func traverseToCalculateHeight(_ node: TreeNode?, _ currentHeight: Int) {
        if node == nil {
            return
        }

        let h = currentHeight + 1
        height = max(height, h)

        traverseToCalculateHeight(node!.left, h)
        traverseToCalculateHeight(node!.right, h)
    }

    private func getLastLevel(_ node: TreeNode?) {
        if node == nil {
            return
        }

        var currentLevel = 1
        var queue = [TreeNode?]()
        queue.append(node)

        while !queue.isEmpty && currentLevel <= height {
            var count = queue.count

            var lastIndex: Int? = nil
            var firstIndex: Int? = nil

            var nextLevelQueue = [TreeNode?]()
            for i in stride(from: count - 1, through: 0, by: -1) {
                // let node = queue.removeLast()
                let node = queue[i]

                if lastIndex == nil, queue[i] != nil {
                    lastIndex = i
                }

                if queue[i] != nil {
                    firstIndex = i
                }
                
                if node == nil {
                    nextLevelQueue.insert(nil, at: 0)
                    nextLevelQueue.insert(nil, at: 0)
                } else {
                    nextLevelQueue.insert(node!.left, at: 0)
                    nextLevelQueue.insert(node!.right, at: 0)
                }
            }

            var w = lastIndex! - firstIndex! + 1
            width = max(width, w)

            queue = nextLevelQueue
            currentLevel += 1
        }
    }

    private func getWidthForLevel(_ level: [TreeNode?]) -> Int {
        var lastIndex: Int? = nil
        var firstIndex: Int? = nil

        for i in 0..<level.count {
            if firstIndex == nil, level[i] != nil {
                firstIndex = i
            }

            if level[i] != nil {
                lastIndex = i
            }
        }

        return lastIndex! - firstIndex! + 1
    }
}
