class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var nums = nums
        var product = 1
        var zeros = 0
        
        for num in nums {
            if num == 0 {
                zeros += 1
            } else {
                product *= num
            }
        }
        
        for i in 0..<nums.count {
            if zeros > 1 {
                nums[i] = 0
            } else if zeros == 1 {
                if nums[i] == 0 {
                    nums[i] = product
                } else {
                    nums[i] = 0
                }
            } else {
                nums[i] = product / nums[i]
            }
        }
        
        return nums
    }
}
