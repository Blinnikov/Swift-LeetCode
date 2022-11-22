class Solution {
    func numSquares(_ n: Int) -> Int {
        var dp = Array(repeating: Int.max, count: n + 1)
        dp[0] = 0

        for i in 1...n {
            var _min = Int.max
            var j = 1
            
            while i - j * j >= 0 {
                _min = min(_min, dp[i - j * j] + 1)
                j += 1
            }

            dp[i] = _min
        }

        return dp[n]
    }
}
