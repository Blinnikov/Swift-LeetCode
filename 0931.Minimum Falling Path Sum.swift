class Solution {
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        var m = matrix
        for i in 1..<m.count {
            for j in 0..<m.count {
                m[i][j] += min(
                    m[i - 1][j],
                    min(
                        m[i - 1][max(0, j - 1)],
                        m[i - 1][min(m.count - 1, j + 1)]
                    )
                )
            }
        }

        return m[m.count - 1].min()!
    }
}
