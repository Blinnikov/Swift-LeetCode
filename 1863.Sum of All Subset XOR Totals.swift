class Solution {
    func subsetXORSum(_ nums: [Int]) -> Int {
        var res = 0

        for n in nums {
            res |= n
        }

        return res << (nums.count - 1)
    }
}
