// Time Limit Exceeded without PQ
class Solution {
    private let _min = -10001
    
    func maxResult(_ nums: [Int], _ k: Int) -> Int {
        var dp = Array(repeating: _min, count: nums.count)
        dp[dp.count-1] = nums[nums.count-1]
        
        for i in stride(from: dp.count-2, through: 0, by: -1) {
            dp[i] = nums[i] + maxElement(dp, i, k)
        }
        
        // print(dp)
        
        return dp[0]
    }
    
    private func maxElement(_ nums: [Int], _ idx: Int, _ k: Int) -> Int {
        let endIndex = min(nums.count-1, idx+k)
        var res = Int.min
        var maxIdx = nums.count
        for i in idx+1...endIndex {
            res = max(res, nums[i])
        }
        
        return res
    }
}
