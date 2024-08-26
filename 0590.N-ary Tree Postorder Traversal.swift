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
    func postorder(_ root: Node?) -> [Int] {
    	var res = [Int]()

        traverse(root, &res)

        return res
    }

    private func traverse(_ node: Node?, _ res: inout [Int]) {
        guard let node = node else {
            return
        }

        for n in node.children {
            traverse(n, &res)
        }

        res.append(node.val)
    }
}
