class Solution {
    private var rows = 0
    private var cols = 0
    
    private var grid = [[Int]]()
    private var visited = [[Bool]]()

    func minDays(_ grid: [[Int]]) -> Int {
        self.rows = grid.count
        self.cols = grid[0].count
        self.grid = grid

        if getIslandsCount() != 1 {
            return 0
        }

        for r in 0..<rows {
            for c in 0..<cols {
                if self.grid[r][c] == 0 {
                    continue
                }

                self.grid[r][c] = 0

                if getIslandsCount() != 1 {
                    return 1
                }

                self.grid[r][c] = 1
            }
        }

        return 2
    }

    private func getIslandsCount() -> Int {
        visited = Array(repeating: Array(repeating: false, count: cols), count: rows)
        var res = 0

        for r in 0..<rows {
            for c in 0..<cols {
                if grid[r][c] == 1, !visited[r][c] {
                    res += 1
                    bfs(r, c)
                }
            }
        }

        return res
    }

    private func bfs(_ r: Int, _ c: Int) {
        if r < 0 || r >= rows || c < 0 || c >= cols {
            return
        }

        if grid[r][c] == 0 {
            return
        }

        if visited[r][c] {
            return
        }

        visited[r][c] = true

        bfs(r - 1, c)
        bfs(r, c + 1)
        bfs(r + 1, c)
        bfs(r, c - 1)
    }
}
