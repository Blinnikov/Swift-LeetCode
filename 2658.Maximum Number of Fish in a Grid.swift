class Solution {
    private var seen = [[Bool]]()
    private var grid = [[Int]]()

    func findMaxFish(_ grid: [[Int]]) -> Int {
        self.grid = grid
        self.seen = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)

        var res = 0

        for r in 0..<grid.count {
            for c in 0..<grid[0].count {
                if grid[r][c] > 0, !seen[r][c] {
                    res = max(res, collect(r, c))
                }
            }
        }

        return res
    }

    private func collect(_ r: Int, _ c: Int) -> Int {
        if r < 0 || r >= grid.count {
            return 0
        }

        if c < 0 || c >= grid[0].count {
            return 0
        }

        if grid[r][c] == 0 {
            return 0
        }

        if seen[r][c] {
            return 0
        }

        seen[r][c] = true

        return grid[r][c] + collect(r + 1, c) + collect(r - 1, c) + collect(r, c + 1) + collect(r, c - 1)
    }
}
