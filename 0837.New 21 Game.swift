class Solution {
    func new21Game(_ n: Int, _ k: Int, _ maxPts: Int) -> Double {
        if k == 0 || n >= k + maxPts {
            return 1
        }

        var dp = Array(repeating: 0.0, count: n + 1)
        dp[0] = 1
        
        var sum = 1.0
        var res = 0.0

        for i in 1...n {
            dp[i] = sum / Double(maxPts)

            if i < k {
                sum += dp[i]
            } else {
                res += dp[i]
            }

            if i - maxPts >= 0 {
                sum -= dp[i - maxPts]
            }
        }

        return res
    }
}
