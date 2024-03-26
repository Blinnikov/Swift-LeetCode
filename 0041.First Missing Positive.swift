class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var _set = Set(nums)

        var i = 1

        while i > 0 {
            if !_set.contains(i) {
                return i
            }

            i += 1
        }

        return -1
    }
}
