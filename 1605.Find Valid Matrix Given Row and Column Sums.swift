class Solution {
    func restoreMatrix(_ rowSum: [Int], _ colSum: [Int]) -> [[Int]] {
        var rows = rowSum
        var cols = colSum

        var res = Array(repeating: Array(repeating: 0, count: cols.count), count: rows.count)

        for r in 0..<rows.count {
            for c in 0..<cols.count {
                res[r][c] = min(rows[r], cols[c])
                rows[r] -= res[r][c]
                cols[c] -= res[r][c]
            }
        }

        return res
    }
}
