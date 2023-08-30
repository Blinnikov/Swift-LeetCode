class Solution {
    func minimumReplacement(_ nums: [Int]) -> Int {
        var res = 0

        var last = nums.last!

        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            var count = nums[i] / last

            if nums[i] % last != 0 {
                count += 1
                last = nums[i] / count
            }

            res += count - 1
        }

        return res
    }
}
