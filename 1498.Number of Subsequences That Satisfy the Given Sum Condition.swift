class Solution {
    private let mod = 1000000007
    private var cache = [Int]()

    func numSubseq(_ nums: [Int], _ target: Int) -> Int {
        var nums = nums.sorted()
        print(nums)
        var lo = 0
        var hi = nums.count - 1

        cache = Array(repeating: 1, count: nums.count)
        for i in 1..<nums.count {
            cache[i] = (cache[i - 1] * 2) % mod
        }

        var res = 0

        while lo <= hi {
            if nums[lo] + nums[hi] > target {
                hi -= 1
            } else {
                res += cache[hi - lo]
                res %= mod
                lo += 1
            }
        }

        return Int(res)
    }
}
