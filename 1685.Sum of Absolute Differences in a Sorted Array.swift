class Solution {
    func getSumAbsoluteDifferences(_ nums: [Int]) -> [Int] {
        let n = nums.count

        var ps = Array(repeating: 0, count: n)
        ps[0] = nums[0]

        var ss = Array(repeating: 0, count: n)
        ss[n - 1] = nums[n - 1]

        for i in 1..<n {
            ps[i] = ps[i - 1] + nums[i]
            ss[n - 1 - i] = ss[n - i] + nums[n - 1 - i]
        }

        var res = Array(repeating: 0, count: n)

        for i in 0..<n {
            res[i] = (nums[i] * i - ps[i]) + (ss[i] - nums[i] * (n - 1 - i))
        }

        return res
    }
}
