class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp = Array(repeating: 0, count: nums.count)
        var res = 0
        
        for i in 0..<nums.count {
            let idx = binarySearch(dp, 0, res, nums[i])
            dp[idx] = nums[i]
            
            if idx == res {
                res += 1
            }
        }
        
        return res
    }
    
    private func binarySearch(_ dp: [Int], _ s: Int, _ e: Int, _ item: Int) -> Int {
        var s = s
        var e = e
        
        while s < e {
            let mid = s + (e - s)/2
            
            if dp[mid] == item {
                return mid
            } else if dp[mid] > item {
                e = mid
            } else {
                s = mid + 1
            }
        }
        
        return s
    }
}
