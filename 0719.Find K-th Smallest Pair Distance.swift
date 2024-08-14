class Solution {
    func smallestDistancePair(_ nums: [Int], _ k: Int) -> Int {
        let max = nums.max()!

        var buckets = Array(repeating: 0, count: max + 1)

        for i in 0..<nums.count {
            for j in (i + 1)..<nums.count {
                let dist = abs(nums[i] - nums[j])

                buckets[dist] += 1
            }
        }

        var k = k

        for i in 0...max {
            k -= buckets[i]

            if k <= 0 {
                return i
            }
        }

        return -1
    }
}
