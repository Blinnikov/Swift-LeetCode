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
    private var map = [Int:[(Int, Int)]]()
    
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        traverse(root, 0, 0)
        
        var result = [[Int]]()
        for k in map.keys.sorted() {
            var subres = [Int]()
            for (_,val) in map[k]!.sorted { $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 } {
                subres.append(val)
            }
            result.append(subres)
        }
        return result
    }
    
    private func traverse(_ node: TreeNode?, _ row: Int, _ col: Int) {
        guard let node = node else {
            return
        }
        
        map[col, default: [(Int, Int)]()].append((row,node.val))
        
        traverse(node.left, row+1, col-1)
        traverse(node.right, row+1, col+1)
    }
}
