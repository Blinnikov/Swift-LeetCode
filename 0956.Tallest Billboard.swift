class Solution {
    func tallestBillboard(_ rods: [Int]) -> Int {
        let len = 5001

        var dp = Array(repeating: -10_000, count: len)
        dp[0] = 0

        for rod in rods {
            var cur = dp
            
            var i = 0
            while (i + rod) < len {
                dp[i + rod] = max(dp[i + rod], cur[i])
                dp[abs(i - rod)] = max(dp[abs(i - rod)], cur[i] + min(i, rod))
                
                i += 1
            }
        }

        return dp[0]
    }
}
