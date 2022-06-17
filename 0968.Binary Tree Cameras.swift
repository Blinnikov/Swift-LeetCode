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
    enum NodeStatus {
        case covered
        case notCovered
        case hasCamera
    }
    
    private var count = 0
    
    func minCameraCover(_ root: TreeNode?) -> Int {
        return dfs(root) == .notCovered ? count+1 : count
    }
    
    private func dfs(_ node: TreeNode?) -> NodeStatus {
        guard var node = node else {
            return .covered
        }
        
        let leftStatus = dfs(node.left)
        let rightStatus = dfs(node.right)
        
        if leftStatus == .notCovered || rightStatus == .notCovered {
            count += 1
            return .hasCamera
        }
        
        if leftStatus == .hasCamera || rightStatus == .hasCamera {
            return .covered
        }
        
        return .notCovered
    }
}
