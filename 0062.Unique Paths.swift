class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if m == 1 || n == 1 {
            return 1
        }
        
        var dp = Array(repeating: Array(repeating: 1, count: n), count: m)
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = dp[i-1][j] + dp[i][j-1]
            }
        }
        
        return dp[m-1][n-1]
    }
    
    // TLE
    func uniquePathsRecursive(_ m: Int, _ n: Int) -> Int {
        if m == 1 && n == 1 {
            return 1
        }
        
        return find(m-1, n-1)
    }
    
    private func find(_ i: Int, _ j: Int) -> Int {
        if i == 0 && j == 0 {
            return 0
        }
        
        if j == 0 || i == 0 {
            return 1
        }
        
        return find(i, j-1) + find(i-1, j)
    }
}
