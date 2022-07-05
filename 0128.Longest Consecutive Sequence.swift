class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        if nums.count <= 1 {
            return nums.count
        }
        
        let nums = nums.sorted()
        
        var minPos = -1
        var maxPos = 0
        var maxLen = 1
        
        for i in 1..<nums.count {
            if nums[i] == nums[i-1] {
                continue
            }
            if nums[i] == nums[i-1] + 1 {
                maxPos += 1
                maxLen = max(maxLen, maxPos - minPos)
            } else {
                maxPos = i
                minPos = i-1
            }
        }
        
        return maxLen
    }
}
