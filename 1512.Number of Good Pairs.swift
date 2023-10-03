class Solution {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var count = [Int:Int]()
        var res = 0

        for n in nums {
            res += count[n, default: 0]
            count[n, default: 0] += 1
        }

        return res
    }
}
