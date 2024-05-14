class Solution {
    private let directions: [(row: Int, col: Int)] = [(1, 0), (-1, 0), (0, -1), (0, 1)]

    private var grid = [[Int]]()

    func getMaximumGold(_ grid: [[Int]]) -> Int {
        self.grid = grid

        var res = 0

        for r in 0..<grid.count {
            for c in 0..<grid[r].count {
                if self.grid[r][c] != 0 {
                    res = max(res, traverse(r, c))
                }
            }
        }

        return res
    }

    private func traverse(_ row: Int, _ col: Int) -> Int {
        if row < 0 || row >= grid.count || col < 0 || col >= grid[0].count {
            return 0
        }

        if grid[row][col] == 0 {
            return 0
        }

        let taken = grid[row][col]
        grid[row][col] = 0

        var res = taken

        for i in 0..<directions.count {
            let r = row + directions[i].row
            let c = col + directions[i].col

            res = max(res, taken + traverse(r, c))
        }

        grid[row][col] = taken

        return res
    }
}
