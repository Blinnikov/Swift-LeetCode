class Solution {
    func maximumSum(_ nums: [Int]) -> Int {
        var map = Array(repeating: (0, 0), count: nums.count)

        for i in 0..<nums.count {
            map[i] = (digitSum(nums[i]), nums[i])
        }

        map.sort { $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 }

        var res = -1

        for i in 1..<map.count {
            if map[i].0 == map[i - 1].0 {
                res = max(res, map[i].1 + map[i - 1].1)
            }
        }

        return res
    }

    private func digitSum(_ n: Int) -> Int {
        var n = n
        var res = 0

        while n > 0 {
            res += n % 10
            n /= 10
        }

        return res
    }
}
