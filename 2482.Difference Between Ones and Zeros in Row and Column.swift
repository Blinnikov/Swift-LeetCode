class Solution {
    func onesMinusZeros(_ grid: [[Int]]) -> [[Int]] {
        let rows = grid.count
        let cols = grid[0].count

        var onesInRows = Array(repeating: 0, count: rows)
        var onesInCols = Array(repeating: 0, count: cols)

        for r in 0..<rows {
            for c in 0..<cols {
                onesInRows[r] += grid[r][c]
            }
        }

        for c in 0..<cols {
            for r in 0..<rows {
                onesInCols[c] += grid[r][c]
            }
        }

        var result = grid

        for r in 0..<rows {
            for c in 0..<cols {
                let ones = onesInRows[r] + onesInCols[c]
                let zeros = (cols - onesInRows[r]) + (rows - onesInCols[c])

                result[r][c] = ones - zeros
            }
        }

        return result
    }
}
