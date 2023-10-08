class Solution {
    func maxDotProduct(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let l1 = nums1.count
        let l2 = nums2.count

        var dp = Array(repeating: Array(repeating: 0, count: l2), count: l1)

        for i in 0..<l1 {
            for j in 0..<l2 {
                dp[i][j] = nums1[i] * nums2[j]

                if i > 0, j > 0 {
                    dp[i][j] += max(0, dp[i - 1][j - 1])
                }

                if i > 0 {
                    dp[i][j] = max(dp[i][j], dp[i - 1][j])
                }

                if j > 0 {
                    dp[i][j] = max(dp[i][j], dp[i][j - 1])
                }
            }
        }

        return dp[l1 - 1][l2 - 1]
    }
}
