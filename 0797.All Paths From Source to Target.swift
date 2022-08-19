class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        let n = graph.count
        let target = n-1
        
        var queue = [(Int, [Int])]()
        queue.append((0, [0]))
        var result = [[Int]]()
        
        while queue.count > 0 {
            var count = queue.count 
            
            while count > 0 {
                let item = queue.removeLast()
                if item.0 == target {
                    result.append(item.1)
                } else {
                    for next in graph[item.0] {
                        queue.append((next, item.1 + [next]))
                    }
                }
                count -= 1
            }
        }
        
        return result
    }
}
