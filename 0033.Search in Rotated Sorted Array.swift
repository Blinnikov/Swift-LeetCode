class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        let last = nums.count - 1
        var lo = 0, hi = last
        
        while lo < hi {
            var mid = lo + (hi - lo) / 2
            
            if (nums[mid] - nums[last]) * (target - nums[last]) > 0 {
                if nums[mid] < target {
                    lo = mid + 1
                } else {
                    hi = mid
                }
            } else if target > nums[last] {
                hi = mid
            } else {
                lo = mid + 1
            }
        }
        
        return nums[lo] == target ? lo : -1
    }
}
