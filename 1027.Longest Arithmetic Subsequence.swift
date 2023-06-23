class Solution {
    func longestArithSeqLength(_ nums: [Int]) -> Int {
        var res = 2

        var map = Array(repeating: [Int:Int](), count: nums.count)
        map[0] = [Int:Int]()

        for i in 1..<nums.count {
            map[i] = [Int:Int]()

            for j in 0..<i {
                let diff = nums[i] - nums[j]

                map[i][diff] = map[j][diff, default: 1] + 1

                res = max(res, map[i][diff]!)
            }
        }

        return res
    }
}
