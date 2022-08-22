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
    
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        guard let root = root else {
            return 0
        }

        return pathSumFrom(root, targetSum) + pathSum(root.left, targetSum) + pathSum(root.right, targetSum)
    }
    
    private func pathSumFrom(_ node: TreeNode?, _ sum: Int) -> Int {
        guard let node = node else {
            return 0
        }
        
        var totalSum = node.val == sum ? 1 : 0
        let leftSum = pathSumFrom(node.left, sum - node.val)
        let rightSum = pathSumFrom(node.right, sum - node.val)

        return totalSum + leftSum + rightSum
    }
    
}
