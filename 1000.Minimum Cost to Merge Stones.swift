class Solution {
    func mergeStones(_ stones: [Int], _ k: Int) -> Int {
        let n = stones.count

        if (n - 1) % (k - 1) > 0 {
            return -1
        }

        var ps = Array(repeating: 0, count: n + 1)

        for i in 0..<n {
            ps[i + 1] = ps[i] + stones[i]
        }
        
        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)

        if k > n {
            return 0
        }

        for m in k...n {
            for i in 0...(n - m) {
                let j = i + m - 1

                dp[i][j] = Int.max

                for mid in stride(from: i, to: j, by: k - 1) {
                    dp[i][j] = min(dp[i][j], dp[i][mid] + dp[mid + 1][j])
                }

                if (j - i) % (k - 1) == 0 {
                    dp[i][j] += ps[j + 1] - ps[i]
                }
            }
        }

        return dp[0][n - 1]
    }
}
