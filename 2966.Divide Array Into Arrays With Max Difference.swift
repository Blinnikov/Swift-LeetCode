class Solution {
    func divideArray(_ nums: [Int], _ k: Int) -> [[Int]] {
        var result = [[Int]]()

        if nums.count % 3 != 0 {
            return result
        }

        let nums = nums.sorted()

        for i in stride(from: 0, to: nums.count, by: 3) {
            if i + 2 < nums.count, nums[i + 2] - nums[i] <= k {
                result.append([nums[i], nums[i + 1], nums[i + 2]])
            } else {
                return [[Int]]()
            }
        }

        return result
    }
}
