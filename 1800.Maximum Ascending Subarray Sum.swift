class Solution {
    func maxAscendingSum(_ nums: [Int]) -> Int {
        var res = nums[0]
        var sum = nums[0]

        for i in 1..<nums.count {
            if nums[i] > nums[i - 1] {
                sum += nums[i]
            } else {
                sum = nums[i]
            }

            res = max(res, sum)
        }

        return res
    }
}
