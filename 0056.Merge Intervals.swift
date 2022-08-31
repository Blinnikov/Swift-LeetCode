class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var intervals = intervals.sorted { $0[0] < $1[0] }
        var result = [[Int]]()
        
        var current = intervals[0]
        var idx = 1 
        
        while idx < intervals.count {
            let next = intervals[idx]
            
            if current[0] == next[0] {
                current = [current[0], max(current[1], next[1])]
            } else {
                if current[1] < next[0] {
                    result.append(current)
                    current = intervals[idx]
                } else {
                    current = [current[0], max(current[1], next[1])]
                }
            }
            
            idx += 1
        }
        
        if result.last != current {
            result.append(current)
        }
        
        return result
    }
}
