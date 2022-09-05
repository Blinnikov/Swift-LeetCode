/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
    func levelOrder(_ root: Node?) -> [[Int]] {
        var result = [[Int]]()
        
        guard let root = root else {
            return result
        }
        
        var queue = [Node]()
        queue.append(root)
        
        while !queue.isEmpty {
            var count = queue.count
            var level = [Int]()
            
            while count > 0 {
                let node = queue.removeLast()
                level.append(node.val)
                
                for c in node.children {
                    queue.insert(c, at: 0)
                }
                
                count -= 1
            }
            
            result.append(level)
        }
        
        return result
    }
}
