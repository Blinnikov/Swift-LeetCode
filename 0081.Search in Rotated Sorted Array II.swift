class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        var lo = 0
        var hi = nums.count - 1

        while lo <= hi {
            let mid = (lo + hi) / 2

            if nums[mid] == target {
                return true
            }

            if nums[mid] < nums[hi] || nums[mid] < nums[lo] {
                if target > nums[mid], target <= nums[hi] {
                    lo = mid + 1
                } else {
                    hi = mid - 1
                }
            } 
            else if nums[mid] > nums[lo] || nums[mid] > nums[hi] {
                if target < nums[mid], target >= nums[lo] {
                    hi = mid - 1
                } else {
                    lo = mid + 1
                }
            } 
            else {
                hi -= 1
            }
        }

        return false
    }
}
