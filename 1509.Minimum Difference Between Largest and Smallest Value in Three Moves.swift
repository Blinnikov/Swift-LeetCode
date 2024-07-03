class Solution {
    func minDifference(_ nums: [Int]) -> Int {
        if nums.count < 5 {
            return 0
        }

        var res = Int.max

        let nums = nums.sorted()

        for i in 0..<4 {
            res = min(res, nums[nums.count - 4 + i] - nums[i])
        }
        

        return res
    }
}
