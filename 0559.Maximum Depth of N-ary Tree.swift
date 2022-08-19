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
    func maxDepth(_ root: Node?) -> Int {
        guard let node = root else {
            return 0
        }
        
        return node.children.reduce(0, { max(maxDepth($1), $0) }) + 1
    }
}
