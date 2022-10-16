class Solution {
    func minDifficulty(_ jobDifficulty: [Int], _ d: Int) -> Int {
        let n = jobDifficulty.count
        if d > n {
            return -1
        }
        
        var dp = Array(repeating: Array(repeating: 0, count: n+1), count: d+1)
        
        for i in 1...n {
            dp[1][i] = max(dp[1][i-1], jobDifficulty[i-1])
        }
        
        if d <= 1 {
            return dp[d][n]
        }
        
        for i in 2...d {
            for j in i...n {
                dp[i][j] = Int.max

                var _max = 0
                for back in stride(from: j, through: i, by: -1) {
                    _max = max(_max, jobDifficulty[back-1])
                    dp[i][j] = min(dp[i][j], dp[i-1][back-1] + _max)
                }
            }
        }
        
        return dp[d][n]
    
    }
}
