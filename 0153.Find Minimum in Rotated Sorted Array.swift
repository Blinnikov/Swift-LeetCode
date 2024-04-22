class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var lo = 0
        var hi = nums.count - 1

        while lo < hi {
            let mid = (lo + hi) / 2

            if nums[mid] > nums[hi] {
                lo = mid + 1
            } else {
                hi = mid
            }
        }

        return nums[lo]
    }
}
