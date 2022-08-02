/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *	   public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func connect(_ root: Node?) -> Node? {
        if root == nil {
            return nil
        }
        
        var queue = [Node]()
        queue.append(root!)
        
        while queue.count != 0 {
            var count = queue.count
            var nextNode: Node? = nil
            
            while count > 0 {
                var currentNode = queue.removeFirst()
                currentNode.next = nextNode
                
                if currentNode.right != nil {
                    queue.append(currentNode.right!)
                }
                
                if currentNode.left != nil {
                    queue.append(currentNode.left!)
                }
                
                nextNode = currentNode
                
                count -= 1
            }
        }
        
        return root
    }
}
