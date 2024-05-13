class Solution {
    private var grid = [[Int]]()

    func matrixScore(_ grid: [[Int]]) -> Int {
        self.grid = grid

        let rows = grid.count
        let cols = grid[0].count

        for row in 0..<rows {
            if self.grid[row][0] == 0 {
                flipRow(row)
            }
        }

        for col in 1..<cols {
            var ones = 0

            for row in 0..<rows {
                if self.grid[row][col] == 1 {
                    ones += 1
                }
            }

            if ones * 2 < rows {
                flipCol(col)
            }
        }

        var res = 0

        for row in 0..<grid.count {
            res += getRowValue(row)
        }

        return res
    }

    private func getRowValue(_ row: Int) -> Int {
        var res = 0

        for col in 0..<grid[row].count {
            res = 2 * res + grid[row][col]
        }

        return res
    }

    private func flipCol(_ col: Int) {
        for row in 0..<grid.count {
            grid[row][col] = 1 - grid[row][col]
        }
    }

    private func flipRow(_ row: Int) {
        for col in 0..<grid[row].count {
            grid[row][col] = 1 - grid[row][col]
        }
    }
}
