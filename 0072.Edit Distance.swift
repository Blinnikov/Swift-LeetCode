class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        if word1.isEmpty && word2.isEmpty {
            return 0
        }
        
        if word1.isEmpty || word2.isEmpty {
            return max(word1.count, word2.count)
        }
        
        var chars1 = Array(word1)
        let m = word1.count
        var chars2 = Array(word2) 
        let n = word2.count
        var dp = Array(repeating: Array(repeating: 0, count: m+1), count: n+1)
        
        for i in 0...m {
            dp[0][i] = i
        }
        
        for j in 0...n {
            dp[j][0] = j
        }
        
        for row in 1...n {
            for col in 1...m {
                dp[row][col] = min(
                    min(dp[row][col-1] + 1, dp[row-1][col] + 1),
                    dp[row-1][col-1] + (chars1[col-1] == chars2[row-1] ? 0 : 1)
                )
            } 
        }
        
        return dp[n][m]
    }
}
