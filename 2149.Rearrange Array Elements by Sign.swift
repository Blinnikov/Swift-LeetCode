class Solution {
    func rearrangeArray(_ nums: [Int]) -> [Int] {
        var res = Array(repeating: 0, count: nums.count)

        var pos = 0
        var neg = 1

        for i in 0..<nums.count {
            if nums[i] < 0 {
                res[neg] = nums[i]
                neg += 2
            } else {
                res[pos] = nums[i]
                pos += 2
            }
        }

        return res
    }
}
