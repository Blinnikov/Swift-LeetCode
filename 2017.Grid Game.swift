class Solution {
    func gridGame(_ grid: [[Int]]) -> Int {
        var sum1 = grid[0].reduce(0, +)
        var sum2 = 0

        var res = Int.max

        for i in 0..<grid[0].count {
            sum1 -= grid[0][i]
            res = min(res, max(sum1, sum2))
            sum2 += grid[1][i]
        }

        return res
    }
}
