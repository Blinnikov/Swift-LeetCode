class Solution {
    func minIncrementForUnique(_ nums: [Int]) -> Int {
        let nums = nums.sorted()

        var res = 0
        var nextUniqueNum = 0

        for n in nums {
            nextUniqueNum = max(nextUniqueNum, n)

            res += (nextUniqueNum - n)

            nextUniqueNum += 1
        }

        return res
    }
}
