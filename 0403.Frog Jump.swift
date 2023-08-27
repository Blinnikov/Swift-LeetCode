class Solution {
    func canCross(_ stones: [Int]) -> Bool {
        let n = stones.count
        
        var dp = Array(repeating: Array(repeating: false, count: n + 1), count: n)
        dp[0][1] = true

        for i in 1..<n {
            for j in 0..<i {
                let diff = stones[i] - stones[j]
                
                if diff < 0 || diff > n || !dp[j][diff] {
                    continue
                }

                dp[i][diff] = true

                if diff - 1 >= 0 {
                    dp[i][diff - 1] = true
                }

                if diff + 1 <= n {
                    dp[i][diff + 1] = true
                }

                if i == n - 1 {
                    return true
                }
            }
        }

        return false
    }
}
