class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var lo = 0
        var hi = nums.count-1
        
        while lo < hi {
            let mid = lo + (hi-lo)/2
            if nums[mid] == target {
                return mid
            }
            
            if nums[mid] < target {
                lo = mid+1
            } else {
                hi = mid-1
            }
        }
        
        return nums[lo] < target ? lo+1 : lo
    }
}
