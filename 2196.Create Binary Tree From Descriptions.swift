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
    func createBinaryTree(_ descriptions: [[Int]]) -> TreeNode? {
        var adj = [Int:(left: Int?, right: Int?)]()
        var parents = [Int: Int]()

        for d in descriptions {
            let p = d[0]
            let value = d[1]
            let isLeft = d[2] == 1

            if parents[p] == nil {
                parents[p] = 0
            }

            parents[value] = p

            if let cur = adj[p] {
                if isLeft {
                    adj[p]!.left = value
                } else {
                    adj[p]!.right = value
                }
            } else {
                var new: (left: Int?, right: Int?) = (nil, nil)
                
                if isLeft {
                    new.left = value
                } else {
                    new.right = value
                }

                adj[p] = new
            }
        }

        var root = 0

        for k in parents.keys {
            if parents[k] == 0 {
                root = k
            }
        }

        return traverse(root, &adj)
    }

    private func traverse(_ val: Int?, _ adj: inout [Int:(left: Int?, right: Int?)]) -> TreeNode? {
        if val == nil {
            return nil
        }

        var node = TreeNode(val!)

        node.left = traverse(adj[val!]?.left, &adj)
        node.right = traverse(adj[val!]?.right, &adj)
        
        return node
    }
}
