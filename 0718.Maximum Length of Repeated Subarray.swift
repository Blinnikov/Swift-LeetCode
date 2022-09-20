class Solution {
    func findLength(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let rows = nums1.count
        let cols = nums2.count
        var dp = Array(repeating: Array(repeating: 0, count: cols+1), count: rows+1)
        var res = 0
        
        for r in stride(from: rows-1, through: 0, by: -1) {
            for c in stride(from: cols-1, through: 0, by: -1) {
                if nums1[r] == nums2[c] {
                    dp[r][c] = dp[r+1][c+1] + 1
                    res = max(res, dp[r][c])
                }
            }
        }
        
        return res
    }
}
