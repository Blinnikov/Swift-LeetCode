class Solution {
    // O(log n) time and O(1) space
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var lo = 0
        var hi = nums.count - 1

        while lo < hi {
            let mid = (lo + hi) / 2
            if (mid & 1 == 1 && nums[mid] == nums[mid - 1]) || (mid & 1 == 0 && nums[mid] == nums[mid + 1]) {
                lo = mid + 1
            } else {
                hi = mid
            }
        }

        return nums[lo]
    }

    // O(n) time and O(n) space
    func singleNonDuplicate_On(_ nums: [Int]) -> Int {
        var map = [Int:Int]()
        for n in nums {
            map[n, default: 0] += 1
        }

        for k in map.keys {
            if map[k] == 1 {
                return k
            }
        }

        return -1
    }  
}
