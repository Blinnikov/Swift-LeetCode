class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        if word1 == word2 {
            return 0
        }
        
        let arr1 = Array(word1), n = arr1.count
        let arr2 = Array(word2), m = arr2.count
        var dp = Array(repeating: Array(repeating: 0, count: n+1) , count: m+1)
        var maxLen = 0
        
        for i in 1...m {
            for j in 1...n {
                if arr1[j-1] == arr2[i-1] {
                    dp[i][j] = dp[i-1][j-1] + 1
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
                maxLen = max(maxLen, dp[i][j])
            }
        }
        
        return (n-maxLen) + (m-maxLen)
    }
}
