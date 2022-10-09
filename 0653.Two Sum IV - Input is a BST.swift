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
    
    private var map = [Int:Int]()
    private var found = false
    
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        traverse(root, k)
        return found
    }
    
    private func traverse(_ node: TreeNode?, _ k: Int) {
        guard let node = node else {
            return
        }
        
        traverse(node.left, k)
        
        map[node.val] = map[node.val, default: 0] + 1
        let counterpart = k - node.val
        if let exist = map[counterpart] {
            if counterpart == node.val {
                if exist > 1 {
                    found = true
                    return
                }
            } else {
                found = true
                return
            }
        }
        
        traverse(node.right, k)
    }
}
