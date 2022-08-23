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

class BSTIterator {
    
    private var storage = [Int]()

    init(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        
        traverse(root)
    }
    
    func next() -> Int {
        storage.removeLast()
    }
    
    func hasNext() -> Bool {
        !storage.isEmpty
    }
    
    private func traverse(_ node: TreeNode) {
        if node.left == nil && node.right == nil {
            storage.insert(node.val, at: 0)
            return
        }
        
        if let left = node.left {
            traverse(left)
        }
        
        storage.insert(node.val, at: 0)
        
        if let right = node.right {
            traverse(right)
        }
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
