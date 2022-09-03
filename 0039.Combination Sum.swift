class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        dfs(candidates, target, [], &result)
        
        return result
    }
    
    private func dfs(_ candidates: [Int], _ target: Int, _ sub: [Int], _ result: inout [[Int]]) {
        if target < 0 {
            return
        }
        
        if target == 0 {
            result.append(sub)
            return
        }
        
        for i in 0..<candidates.count {
            dfs(Array(candidates[i...]), target-candidates[i], sub+[candidates[i]], &result)
        }
    }
}
