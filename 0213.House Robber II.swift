class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        if nums.count == 2 {
            return max(nums[0], nums[1])
        }
        
        let n = nums.count
        var dp1 = Array(repeating: 0, count: n)
        var dp2 = Array(repeating: 0, count: n)
        dp1[0] = nums[0]
        dp1[1] = max(nums[0], nums[1])
        
        dp2[0] = 0
        dp2[1] = nums[1]
        
        for i in 2..<n {
            dp1[i] = nums[i] + dp1[i - 2]
            dp1[i - 1] = max(dp1[i - 1], dp1[i - 2])
            
            dp2[i] = nums[i] + dp2[i - 2]
            dp2[i - 1] = max(dp2[i - 1], dp2[i - 2])
        }
        
        return max(dp1[n - 2], dp2[n - 1])
    }
}
