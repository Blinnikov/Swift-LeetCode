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
    
    private var paths = 0
    
    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        guard let root = root else {
            return -1
        }
        
        var set = Set<Int>()
        traverse(root, set)
        return paths
    }
    
    private func traverse(_ node: TreeNode, _ set: Set<Int>) {
        var set = set
        if set.contains(node.val) {
            set.remove(node.val)
        } else {
            set.insert(node.val)
        }
        
        if node.left == nil && node.right == nil {
            // print(set)
            if set.count == 0 || set.count == 1 {
                paths += 1
            }
            return
        }
        
        if let left = node.left {
            traverse(left, set)
        }
        
        if let right = node.right {
            traverse(right, set)
        }
    }
}
