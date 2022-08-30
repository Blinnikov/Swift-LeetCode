class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var res = nums[0], _min = nums[0], _max = nums[0]
        
        for i in 1..<nums.count {
            let newMax = nums[i] * _max, newMin = nums[i] * _min
            _max = max(max(newMax, newMin), nums[i])
            _min = min(min(newMax, newMin), nums[i])
            res = max(res, _max)
        }
        
        return res
    }
}
