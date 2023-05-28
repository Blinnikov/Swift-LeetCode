class Solution {
    func minCost(_ n: Int, _ cuts: [Int]) -> Int {
        var cuts = cuts
        
        cuts.append(0)
        cuts.append(n)

        cuts.sort()

        var dp = Array(repeating: Array(repeating: 0, count: cuts.count), count: cuts.count)

        for i in stride(from: cuts.count - 1, through: 0, by: -1) {
            for j in (i + 1)..<cuts.count {
                for k in (i + 1)..<j {
                    dp[i][j] = min (
                        dp[i][j] == 0 ? Int.max : dp[i][j],
                        cuts[j] - cuts[i] + dp[i][k] + dp[k][j]
                    )
                }
            }
        }

        return dp[0][cuts.count - 1]
    }
}
