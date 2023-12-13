class Solution {
    func numSpecial(_ mat: [[Int]]) -> Int {
        var rows = Array(repeating: 0, count: mat.count)
        var cols = Array(repeating: 0, count: mat[0].count)

        for r in 0..<mat.count {
            for c in 0..<mat[0].count {
                if mat[r][c] == 1 {
                    rows[r] += 1
                    cols[c] += 1
                }
            }
        }

        var res = 0

        for r in 0..<mat.count {
            for c in 0..<mat[0].count {
                if mat[r][c] == 1, rows[r] == 1, cols[c] == 1 {
                    res += 1
                }
            }
        }

        return res
    }
}
