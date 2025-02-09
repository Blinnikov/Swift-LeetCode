class Solution {
    func countBadPairs(_ nums: [Int]) -> Int {
        var res = 0
        var map = [Int:Int]()

        for i in 0..<nums.count {
            let diff = i - nums[i]

            res += i - map[diff, default: 0]

            map[diff, default: 0] += 1
        }

        return res
    }
}
