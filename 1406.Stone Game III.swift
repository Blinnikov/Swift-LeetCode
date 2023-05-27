class Solution {
    func stoneGameIII(_ stoneValue: [Int]) -> String {
        var dp = Array(repeating: Int.min, count: stoneValue.count + 1)
        dp[dp.count - 1] = 0

        for i in stride(from: stoneValue.count - 1, through: 0, by: -1) {
            var take = 0

            for j in 0...2 {
                if (i + j) >= stoneValue.count {
                    break
                }

                take += stoneValue[i + j]
                dp[i] = max(dp[i], take - dp[i + j + 1])
            }

        }

        switch dp[0] {
            case 1...: return "Alice"
            case ..<0: return "Bob"
            default: return "Tie"
        }
    }
}
