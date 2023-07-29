class Solution {
    private var dp = Array(repeating: Array(repeating: 0.0, count: 200), count: 200)

    func soupServings(_ n: Int) -> Double {
        return n > 4800 
                ? 1.0
                : probability(for: (n + 24) / 25, and: (n + 24) / 25)
    }

    private func probability(for a: Int, and b: Int) -> Double {
        if a <= 0, b <= 0 {
            return 0.5
        }

        if a <= 0 {
            return 1.0
        }

        if b <= 0 {
            return 0.0
        }

        if dp[a][b] > 0 {
            return dp[a][b]
        }

        dp[a][b] = 0.25 * (
            probability(for: a - 4, and: b) +
            probability(for: a - 3, and: b - 1) +
            probability(for: a - 2, and: b - 2) +
            probability(for: a - 1, and: b - 3)
        )

        return dp[a][b]
    }
}
