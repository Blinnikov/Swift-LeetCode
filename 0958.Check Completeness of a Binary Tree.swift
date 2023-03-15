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
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return false
        }

        let height = depth(root) - 1
        
        var level = 0
        var queue = [TreeNode]()
        queue.append(root)

        var wasEmptyNodeOnLeafLevel = false

        while !queue.isEmpty {
            var levelCurrentCount = queue.count
            var levelFullCount = Int(pow(2.0, Double(level)))

            print(levelFullCount)
            if level != height && levelCurrentCount != levelFullCount {
                return false
            }
            

            while levelCurrentCount > 0 {
                let node = queue.removeLast()
                if (level == height - 1) && node.left == nil && node.right != nil {
                    return false
                }
                if let left = node.left {
                    if wasEmptyNodeOnLeafLevel {
                        return false
                    }
                    queue.insert(left, at: 0)
                } else if level == height - 1 {
                    wasEmptyNodeOnLeafLevel = true
                }
                if let right = node.right {
                    if wasEmptyNodeOnLeafLevel {
                        return false
                    }
                    queue.insert(right, at: 0)
                } else if level == height - 1 {
                    wasEmptyNodeOnLeafLevel = true
                }
                
                levelCurrentCount -= 1;
            }

            level += 1
        }

        return true
    }
    
    func depth(_ node: TreeNode?) -> Int {
        guard node != nil else {
            return 0
        }
        
        let left = depth(node!.left)
        let right = depth(node!.right)
        return max(left,right) + 1
    }
}
