class Solution {
    func luckyNumbers (_ matrix: [[Int]]) -> [Int] {
        var rows = Array(repeating: Int.max, count: matrix.count)
        var cols = Array(repeating: 0, count: matrix[0].count)

        for r in 0..<matrix.count {
            for c in 0..<matrix[r].count {
                rows[r] = min(rows[r], matrix[r][c])
                cols[c] = max(cols[c], matrix[r][c])
            }
        }

        var res = [Int]()

        for r in 0..<matrix.count {
            for c in 0..<matrix[r].count {
                if matrix[r][c] == rows[r], matrix[r][c] == cols[c] {
                    res.append(matrix[r][c])
                }
            }
        }

        return res
    }
}
