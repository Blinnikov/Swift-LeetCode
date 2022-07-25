class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        binarySearch(nums, target, 0, nums.count - 1)
    }
    
    private func binarySearch(_ nums: [Int], _ target: Int, _ lo: Int, _ hi: Int) -> [Int] {
        if lo > hi { 
            return [-1, -1] 
        }
        
        let mid = lo + (hi-lo)/2
        if nums[mid] == target {
            var resLo = mid
            var resHi = mid
            
            while resLo >= 0 && nums[resLo] == target {
                resLo -= 1
            }
            while resHi < nums.count && nums[resHi] == target {
                resHi += 1
            }
            resLo += 1
            resHi -= 1
            
            return [resLo, resHi]
            
        } 
        
        if nums[mid] < target {
            return binarySearch(nums, target, mid+1, hi)
        } else {
            return binarySearch(nums, target, lo, mid-1)
        }
    }
    
    func searchRangeHacky(_ nums: [Int], _ target: Int) -> [Int] {
        [nums.firstIndex(of: target) ?? -1, nums.lastIndex(of: target) ?? -1]
    }
}
