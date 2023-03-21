class Solution {
    func zeroFilledSubarray(_ nums: [Int]) -> Int {
        var result = 0
        var consecutiveSubarrays = 0

        for num in nums {
            if num == 0 {
                consecutiveSubarrays += 1
                result += consecutiveSubarrays
            } else {
                consecutiveSubarrays = 0
            }
        }

        return result
    }
}
