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
    func preorder(_ root: Node?) -> [Int] {
    	guard let root = root else {
            return []
        }
        
        // iterative
        var result = [Int]()
        var stack = [Node]()
        stack.append(root)
        
        while !stack.isEmpty {
            let node = stack.removeLast()
            result.append(node.val)
            
            for i in 0..<node.children.count {
                stack.append(node.children[node.children.count - 1 - i])
            }
        }
        
        return result
    }
    
    func preorderRecursive(_ root: Node?) -> [Int] {
    	var result: [Int] = []
        preorderRecursive(root, &result)
        return result
    }
    
    private func preorderRecursive(_ node: Node?, _ result: inout [Int]) {
        guard let node = node else {
            return
        }
        
        result.append(node.val)
        for child in node.children {
            preorderRecursive(child, &result)
        }
    }
}
