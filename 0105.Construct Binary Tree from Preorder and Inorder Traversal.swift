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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        return construct(preorder, 0, preorder.count-1, inorder, 0, inorder.count-1)
    }
    
    private func construct(_ preorder: [Int], _ pS: Int, _ pE: Int, _ inorder: [Int], _ iS: Int, _ iE: Int) -> TreeNode? {
        if pS > pE {
            return nil
        }
        
        if pS == pE {
            return TreeNode(preorder[pS])
        }
        
        var rootVal = preorder[pS]
        
        let rootInorderIdx = inorder.firstIndex(of: rootVal)!
        let leftIS = iS
        let leftIE = rootInorderIdx - 1
        let leftCount = leftIE - leftIS + 1
        let rightIS = rootInorderIdx + 1
        let rightIE = iE
        let rightCount = rightIE - rightIS + 1
        
        let leftPS = pS + 1
        let leftPE = pS + leftCount
        let rightPS = leftPE + 1
        let rightPE = leftPE + rightCount
        
        let left = construct(preorder, leftPS, leftPE, inorder, leftIS, leftIE)
        let right = construct(preorder, rightPS, rightPE, inorder, rightIS, rightIE)
        
        return TreeNode(rootVal, left, right)
    }
}
