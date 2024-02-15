class Solution {
    func largestPerimeter(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        
        var sum = 0
        var res = -1

        for i in 0..<nums.count {
            if nums[i] < sum {
                res = nums[i] + sum
            }

            sum += nums[i]
        }

        return res
    }
}
