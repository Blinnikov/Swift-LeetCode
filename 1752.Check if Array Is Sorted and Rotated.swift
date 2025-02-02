class Solution {
    func check(_ nums: [Int]) -> Bool {
        let n = nums.count
        var start = 0

        for i in 0..<n - 1 {
            if nums[i] > nums[i + 1] {
                start = i + 1
            }
        }

        for i in 0..<n - 1 {
            let lo = (i + start) % n
            let hi = (i + 1 + start) % n

            if nums[hi] < nums[lo] {
                return false
            }
        }

        return true
    }
}
