class Solution {
    private let maxCost = 1000001
    
    func minCost(_ houses: [Int], _ cost: [[Int]], _ m: Int, _ n: Int, _ target: Int) -> Int {
        // dp[i,j,k] 
        // i - houses 1...m
        // j - colors 1...n
        // k  -neighs 1...target
        
        var dp = Array(
            repeating: Array(
                repeating: Array(repeating: -1, count: target+1),
                count: n+1
            ),
            count: m
        )
        
        let result = solve(&dp, houses, cost, target, 0, 0, 0)
        return result == maxCost ? -1 : result
    }
    
    private func solve(_ dp: inout [[[Int]]], _ houses: [Int], _ cost: [[Int]], _ target: Int, _ i: Int, _ j: Int, _ k: Int) -> Int {
        if i == houses.count {
            return k == target ? 0 : maxCost
        }
        
        if k > target {
            return maxCost
        }
        
        if dp[i][j][k] != -1 {
            return dp[i][j][k]
        }
        
        var minCost = maxCost
        
        if houses[i] != 0 {
            let neighs = k + (houses[i] != j ? 1 : 0)
            minCost = solve(&dp, houses, cost, target, i+1, houses[i], neighs)
        } else {
            for idx in 1...cost[0].count {
                let neighs = k + (idx != j ? 1 : 0)
                let c = cost[i][idx-1] + solve(&dp, houses, cost, target, i+1, idx, neighs)
                minCost = min(c, minCost)
            }
        }
        
        dp[i][j][k] = minCost
        return minCost
    }
}
