class Solution {
    private let base = 1000000007
    private var memo = Array(repeating: Array(repeating: -1, count: 1001), count: 1001) 
    
    func kInversePairs(_ n: Int, _ k: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: k+1), count: n+1)
        for i in 1...n {
            for j in 0...k {
                if j == 0 {
                    dp[i][j] = 1
                } else {
                    for idx in 0...min(j, i-1) {
                        dp[i][j] = (dp[i][j] + dp[i-1][j-idx]) % base
                    }
                }
            }
        }
        
        return dp[n][k]
    }
    
    // TLE
    func kInversePairsRecursive(_ n: Int, _ k: Int) -> Int {
        if n == 0 {
            return 0
        }
        
        if k == 0 {
            return 1
        }
        
        if memo[n][k] != -1 {
            return memo[n][k]
        }
        
        var inverse = 0
        for i in 0...min(k, n-1) {
            inverse = (inverse + kInversePairs(n-1, k-i)) % base
        }
        memo[n][k] = inverse
        
        return inverse
    }
}
