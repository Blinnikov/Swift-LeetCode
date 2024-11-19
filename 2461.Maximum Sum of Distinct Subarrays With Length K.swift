class Solution {
    func maximumSubarraySum(_ nums: [Int], _ k: Int) -> Int {
        var res = 0
        var sum = 0

        var lo = 0 
        var hi = 0

        var map = [Int:Int]()

        while hi < nums.count {
            let num = nums[hi]
            let idx = map[num, default: -1]

            while lo <= idx || hi - lo + 1 > k {
                sum -= nums[lo]
                lo += 1
            }

            map[num] = hi

            sum += num

            if hi - lo + 1 == k {
                res = max(res, sum)
            }

            hi += 1
        }

        return res
    }
}
