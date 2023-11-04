class Solution {
    func getLastMoment(_ n: Int, _ left: [Int], _ right: [Int]) -> Int {
        var res = 0

        for position in left {
            res = max(res, position)
        }

        for position in right {
            res = max(res, n - position)
        }

        return res
    }
}
