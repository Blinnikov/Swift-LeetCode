class Solution {
    func countServers(_ grid: [[Int]]) -> Int {
        var cols = Array(repeating: 0, count: grid.count)
        var rows = Array(repeating: 0, count: grid[0].count)

        for r in 0..<grid.count {
            for c in 0..<grid[0].count {
                if grid[r][c] == 1 {
                    cols[r] += 1
                    rows[c] += 1
                }
            }
        }

        var res = 0

        for r in 0..<grid.count {
            for c in 0..<grid[0].count {
                if grid[r][c] == 1 {
                    if rows[c] > 1 || cols[r] > 1 {
                        res += 1
                    }
                }
            }
        }

        return res
    }
}
