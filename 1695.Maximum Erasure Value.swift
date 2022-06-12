class Solution {
    func maximumUniqueSubarray(_ nums: [Int]) -> Int {
        var set = Set<Int>()
        var lo = 0, hi = 0, sum = 0, maxSum = 0
        
        for hi in 0..<nums.count {
            while set.contains(nums[hi]) {
                set.remove(nums[lo])
                sum -= nums[lo]
                lo += 1
                
            }
            
            set.insert(nums[hi])
            sum += nums[hi]
            maxSum = max(maxSum, sum)
        }

        return maxSum
    }
}
