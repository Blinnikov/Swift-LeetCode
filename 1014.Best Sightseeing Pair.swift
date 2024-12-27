class Solution {
    func maxScoreSightseeingPair(_ values: [Int]) -> Int {
        var dp = Array(repeating: 0, count: values.count)
        dp[0] = values[0]

        var res = 0

        for i in 1..<values.count {
            res = max(res, dp[i - 1] + values[i] - i)
            dp[i] = max(dp[i - 1], values[i] + i)
        }

        return res
    }
}
