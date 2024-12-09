class Solution {
    func isArraySpecial(_ nums: [Int], _ queries: [[Int]]) -> [Bool] {
        var ps = Array(repeating: 0, count: nums.count)

        for i in 1..<nums.count {
            ps[i] = nums[i] & 1 == nums[i - 1] & 1 
                ? ps[i - 1] + 1
                : ps[i - 1]
        }

        var res = Array(repeating: false, count: queries.count)

        for i in 0..<queries.count {
            res[i] = ps[queries[i][1]] - ps[queries[i][0]] == 0;
        }

        return res
    }
}
