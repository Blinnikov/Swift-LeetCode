class Solution {
    func numWays(_ steps: Int, _ arrLen: Int) -> Int {
        let maxStep = min(steps, arrLen)
        
        var dp = Array(repeating: Array(repeating: 0, count: maxStep + 1), count: steps + 1)
        dp[0][0] = 1

        for i in 1...steps {
            for j in 0..<maxStep {
                let stay = dp[i - 1][j]
                let right = dp[i - 1][j + 1]
                let left = j > 0 ? dp[i - 1][j - 1] : 0

                dp[i][j] = (stay + left + right) % 1_000_000_007
            }
        }

        return dp[steps][0]
    }
}
