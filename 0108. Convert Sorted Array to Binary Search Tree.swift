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
    private(set) var _nums = [Int]()
    
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        _nums = nums
        
        return transform(0, nums.count-1)
    }
    
    private func transform(_ s: Int, _ e: Int) -> TreeNode {
        // print("Transforming \(s), \(e)")
        if s == e {
            return TreeNode(_nums[s])
        }
        
        let mid = s + (e - s + 1) / 2
        // print("finding subtrees [\(s)..\(mid-1),\(mid),\(mid+1)..\(e)]")
        let left = mid-1 >= s ? transform(s, mid-1) : nil
        let right = mid+1 <= e ? transform(mid+1, e) : nil
        
        return TreeNode(_nums[mid], left, right)
    }
}
