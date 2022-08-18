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

class FindElements {
    
    private var all: Set<Int> = []
    private let root: TreeNode

    init(_ root: TreeNode?) {
        self.root = root!
        recover(self.root, 0)
    }
    
    func find(_ target: Int) -> Bool {
        all.contains(target)
    }
    
    private func recover(_ node: TreeNode?, _ val: Int) {
        guard var node = node else {
            return
        }
        
        node.val = val
        all.insert(val)
        if node.left != nil {
            recover(node.left, 2*val+1)
        }
        if node.right != nil {
            recover(node.right, 2*val+2)
        }
    }
}

/**
 * Your FindElements object will be instantiated and called as such:
 * let obj = FindElements(root)
 * let ret_1: Bool = obj.find(target)
 */
