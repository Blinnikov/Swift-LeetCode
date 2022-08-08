/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */

class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        if node == nil {
            return nil
        }
        
        var adj = [Int:Set<Int>]()
        var nodes = [Int:Node]()
        
        var processed = Set<Int>();
        
        var queue = [Node]()
        queue.insert(node!, at: 0) 
        
        while queue.count > 0 {
            var count = queue.count
            while count != 0 {
                let node = queue.removeLast()
                nodes[node.val] = Node(node.val)

                processed.insert(node.val)
                
                for n in node.neighbors {
                    if let n = n, !processed.contains(n.val) {
                        adj[node.val, default: Set<Int>()].insert(n.val)
                        adj[n.val, default: Set<Int>()].insert(node.val)
                        queue.insert(n, at: 0)
                    }
                }
                
                count -= 1
            }
        }
        
        for k in adj.keys {
            var root = nodes[k]!
            for sibl in adj[k]! {
                root.neighbors.append(nodes[sibl]!)
            }
        }
        
        return nodes[node!.val]
    }
}
