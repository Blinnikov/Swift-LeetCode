class Solution {
    private var grid = [[Int]]()

    func numMagicSquaresInside(_ grid: [[Int]]) -> Int {
        if grid.count < 3 || grid[0].count < 3 {
            return 0
        }

        self.grid = grid

        var res = 0

        for r in 0..<grid.count - 2 {
            for c in 0..<grid[0].count - 2 {
                if isMagic(r, c) {
                    res += 1
                }
            }
        }

        return res
    }

    private func isMagic(_ r: Int, _ c: Int) -> Bool {
        var set = Set<Int>()

        for row in r..<(r + 3) {
            for col in c..<(c + 3) {
                let n = grid[row][col]

                if n < 1 || n > 9 {
                    return false
                }

                if set.contains(n) {
                    return false
                }

                set.insert(n)
            }
        }

        let firstRow = grid[r][c] + grid[r][c + 1] + grid[r][c + 2]

        for row in r..<(r + 3) {
            if grid[row][c] + grid[row][c + 1] + grid[row][c + 2] != firstRow {
                return false
            }
        }

        for col in c..<(c + 3) {
            if grid[r][col] + grid[r + 1][col] + grid[r + 2][col] != firstRow {
                return false
            }
        }

        if grid[r][c] + grid[r + 1][c + 1] + grid[r + 2][c + 2] != firstRow {
            return false
        }

        if grid[r][c + 2] + grid[r + 1][c + 1] + grid[r + 2][c] != firstRow {
            return false
        }

        return true
    }
}
