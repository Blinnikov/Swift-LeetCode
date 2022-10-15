class Solution {
    func getLengthOfOptimalCompression(_ s: String, _ k: Int) -> Int {
        
        var s = Array(s)
        let n = s.count
        var dp = Array(repeating: Array(repeating: 101, count: n+1), count: n+1)
        dp[0][0] = 0
        
        for row in 1...n {
            for col in 0...k {
                
                var count = 0
                var del = 0
                
                for backRow in stride(from: row, through: 1, by: -1) {
                    if s[backRow-1] == s[row-1] {
                        count += 1
                    } else {
                        del += 1
                    }
                    
                    if col - del >= 0 {
                        dp[row][col] = min(
                            dp[row][col],
                            dp[backRow-1][col-del] + 1 
                                + (count >= 100 ? 3 : count >= 10 ? 2 : count >= 2 ? 1 : 0)
                        )
                    }
                }
                
                if col > 0 {
                    dp[row][col] = min(dp[row][col], dp[row-1][col-1])
                }
            }
        }
        
        return dp[n][k]
    }
}
