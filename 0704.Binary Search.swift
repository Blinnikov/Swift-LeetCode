class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        return binarySearch(nums, target, lo: 0, hi: nums.count-1)
    }
    
    private func binarySearch(_ nums: [Int], _ target: Int, lo: Int, hi: Int) -> Int {
        if lo > hi || lo < 0 || hi > nums.count-1 {
            return -1
        }
        
        if lo == hi && nums[lo] == target {
            return lo
        }
        
        let mid = lo + (hi-lo)/2
        if nums[mid] == target {
            return mid
        }
        
        if nums[mid] > target {
            return binarySearch(nums, target, lo: lo, hi: mid-1)
        } else {
            return binarySearch(nums, target, lo: mid+1, hi: hi)
        }
    }
}
