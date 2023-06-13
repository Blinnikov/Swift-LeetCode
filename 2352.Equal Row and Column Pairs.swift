class Solution {
    private var grid = [[Int]]()

    func equalPairs(_ grid: [[Int]]) -> Int {
        self.grid = grid

        let n = grid.count

        var res = 0

        for row in 0..<n {
            for col in 0..<n {
                if equal(row, col, n) {
                    res += 1
                }
            }
        }

        return res
    }

    private func equal(_ row: Int, _ col: Int, _ n: Int) -> Bool {
        for idx in 0..<n {
            if grid[row][idx] != grid[idx][col] {
                return false
            }
        }

        return true
    }
}
