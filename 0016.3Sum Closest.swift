class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 3 {
            return nums[0] + nums[1] + nums[2]
        }
        
        var nums = nums.sorted()
        var result = nums[0] + nums[1] + nums[2]
        
        for i in 0..<nums.count {
            var left = i + 1
            var right = nums.count - 1
            
            while left < right {
                let sum = nums[i] + nums[left] + nums[right]
                if sum == target {
                    return sum
                }
                if abs(sum - target) < abs(result - target) {
                    result = sum
                }
                
                if sum > target {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
        
        return result
    }
}
