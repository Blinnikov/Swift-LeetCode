class Solution {
    private var grid = [[Cell]]()

    func countUnguarded(_ m: Int, _ n: Int, _ guards: [[Int]], _ walls: [[Int]]) -> Int {
        self.grid = Array(repeating: Array(repeating: .Unguarded, count: n), count: m)

        for g in guards {
            grid[g[0]][g[1]] = .Guard
        }

        for w in walls {
            grid[w[0]][w[1]] = .Wall
        }

        for g in guards {
            mark(g[0], g[1])
        }

        var res = 0

        for r in grid {
            for c in r {
                if c == .Unguarded {
                    res += 1
                }
            }
        }

        return res
    }

    private func mark(_ row: Int, _ col: Int) {
        for r in stride(from: row - 1, through: 0, by: -1) {
            if grid[r][col] == .Wall || grid[r][col] == .Guard {
                break
            }

            grid[r][col] = .Guarded
        }

        for r in (row + 1)..<grid.count {
            if grid[r][col] == .Wall || grid[r][col] == .Guard {
                break
            }

            grid[r][col] = .Guarded
        }

        for c in stride(from: col - 1, through: 0, by: -1) {
            if grid[row][c] == .Wall || grid[row][c] == .Guard {
                break
            }

            grid[row][c] = .Guarded
        }

        for c in (col + 1)..<grid[0].count {
            if grid[row][c] == .Wall || grid[row][c] == .Guard {
                break
            }

            grid[row][c] = .Guarded
        }
    }

    enum Cell {
        case Guard
        case Wall
        case Guarded
        case Unguarded
    }
}
