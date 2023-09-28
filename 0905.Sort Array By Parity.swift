class Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var nums = nums

        var lo = 0
        var hi = 0

        while hi < nums.count {
            if nums[hi] % 2 == 0 {
                nums.swapAt(lo, hi)
                lo += 1
            }

            hi += 1
        }

        return nums
    }

    func sortArrayByParity_v1(_ nums: [Int]) -> [Int] {
        nums.sorted {
            if ($0 % 2 == 0 && $1 % 2 == 0) || ($0 % 2 != 0 && $1 % 2 != 0) {
                return $0 < $1
            }
            
            if $0 % 2 == 0 {
                return true
            }
            
            return false
        }
    }
}
