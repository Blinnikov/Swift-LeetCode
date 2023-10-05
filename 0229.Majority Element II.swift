class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        let majority = nums.count / 3

        var map = [Int:Int]()

        for n in nums {
            map[n, default: 0] += 1
        }

        var result = [Int]()

        for (k, v) in map {
            if v > majority {
                result.append(k)
            }
        }

        return result
    }
}
