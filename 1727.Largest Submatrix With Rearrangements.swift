class Solution {
    func largestSubmatrix(_ matrix: [[Int]]) -> Int {
        var m = matrix

        for r in 1..<m.count {
            for c in 0..<m[r].count {
                if m[r][c] == 1 {
                    m[r][c] = m[r - 1][c] + 1
                }
            }
        }

        var res = 0

        for r in 0..<m.count {
            let row = m[r].sorted()

            for col in stride(from: row.count - 1, through: 0, by: -1) {
                let area = row[col] * (row.count - col)
                res = max(res, area)
            }
        }

        return res
    }
}
