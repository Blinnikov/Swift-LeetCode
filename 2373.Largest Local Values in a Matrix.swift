class Solution {
    func largestLocal(_ grid: [[Int]]) -> [[Int]] {
        let n = grid.count
        var grid = grid
        var res = Array(repeating: Array(Array(repeating: 0, count: n - 2)), count: n - 2)

        for r in 0..<res.count {
            for c in 0..<res.count {
                res[r][c] = findMax(&grid, r, r + 2, c, c + 2)
            }
        }

        return res
    }

    private func findMax(_ grid: inout[[Int]], _ rowMin: Int, _ rowMax: Int, _ colMin: Int, _ colMax: Int) -> Int {
        var res = 0

        for row in rowMin...rowMax {
            for col in colMin...colMax {
                res = max(res, grid[row][col])
            }
        }

        return res
    }
}
