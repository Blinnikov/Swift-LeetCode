class Solution {
    func minTaps(_ n: Int, _ ranges: [Int]) -> Int {
        let maxVal = n + 2
        
        var dp = Array(repeating: maxVal, count: n + 1)
        dp[0] = 0

        for i in 0...n {
            let from = max(i - ranges[i] + 1, 0)
            let to = min(i + ranges[i], n)

            if from > to {
                continue
            }

            for j in from...to {
                let val = dp[max(i - ranges[i], 0)] + 1
                
                if val < dp[j] {
                    dp[j] = val
                }
            }
        }

        return dp[n] < maxVal ? dp[n] : -1
    }
}
