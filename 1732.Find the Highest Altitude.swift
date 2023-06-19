class Solution {
    func largestAltitude(_ gain: [Int]) -> Int {
        var res = 0
        var sum = 0

        for g in gain {
            sum += g
            res = max(res, sum)
        }

        return res
    }
}
