class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n <= 2 {
            return n
        }
        
        // return climbStairs(n-1) + climbStairs(n-2)
        
        var dp = Array(repeating: 0, count: n)
        dp[0] = 1
        dp[1] = 2
        
        for i in 2..<n {
            dp[i] = dp[i-1] + dp[i-2]
        }
        
        return dp[n-1]
    }
}
