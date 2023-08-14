class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        // nums.sorted()[nums.count - k]
        
        var nums = nums

        return quickSelect(&nums, 0, nums.count - 1, k)
    }

    private func quickSelect(_ nums: inout [Int], _ lo: Int, _ hi: Int, _ k: Int) -> Int {
        var pivot = lo;

        for i in lo..<hi {
            if nums[i] <= nums[hi] {
                nums.swapAt(i, pivot)
                pivot += 1
            }
        }

        nums.swapAt(hi, pivot)

        let count = hi - pivot + 1

        if count == k {
            return nums[pivot]
        }

        if count > k {
            return quickSelect(&nums, pivot + 1, hi, k)
        }

        return quickSelect(&nums, lo, pivot - 1, k - count)
    }
}
