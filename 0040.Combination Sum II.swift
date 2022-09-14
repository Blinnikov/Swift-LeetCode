class Solution {
    
    private var result = [[Int]]()
    
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        dfs(candidates.sorted(), target, [], 0)
        return result
    }
    
    private func dfs(_ candidates: [Int], _ target: Int, _ sub: [Int], _ idx: Int) {        
        if target == 0 {
            result.append(sub)
            return
        }
        
        for i in idx..<candidates.count {
            
            if i > idx && candidates[i] == candidates[i-1] {
                continue
            }
            
            let nextTarget = target-candidates[i]
            if nextTarget >= 0 {
                dfs(candidates, nextTarget, sub+[candidates[i]], i+1)
            } else {
                break
            }
        }
    }
}
