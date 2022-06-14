class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var arr1 = Array(text1), m = arr1.count
        var arr2 = Array(text2), n = arr2.count
        var dp = Array(repeating: Array(repeating: 0, count: m+1), count: n+1)
        
        for i in 1...n {
            for j in 1...m {
                if arr2[i-1] == arr1[j-1] {
                    dp[i][j] = 1 + dp[i-1][j-1]
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        
        return dp[n][m]
    }
}
