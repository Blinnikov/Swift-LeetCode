class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        if root == nil {
            return result
        }
        
        var queue = [TreeNode]()
        queue.insert(root!, at: 0)
        
        while !queue.isEmpty {
            var count = queue.count
            var levelSubResult = [Int]()
            
            while count > 0 {
                let item = queue.removeLast()
                levelSubResult.append(item.val)
                
                if let left = item.left {
                    queue.insert(left, at: 0)
                }
                
                if let right = item.right {
                    queue.insert(right, at: 0)
                }
                
                count -= 1
            }
            
            result.append(levelSubResult)
        }
        
        return result
    }
}
