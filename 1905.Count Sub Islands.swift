class Solution {
    private let dirs = [(row: 0, col: 1), (row: 1, col: 0), (row: 0, col: -1), (row: -1, col: 0)]

    private var g1 = [[Int]]()
    private var g2 = [[Int]]()

    func countSubIslands(_ grid1: [[Int]], _ grid2: [[Int]]) -> Int {
        self.g1 = grid1
        self.g2 = grid2

        var seen = Array(repeating: Array(repeating: false, count: g2[0].count), count: g2.count)
        
        var res = 0

        for r in 0..<g2.count {
            for c in 0..<g2[0].count {
                if !seen[r][c], g2[r][c] == 1, subIsland(r, c, &seen) {
                    res += 1
                }
            }
        }

        return res
    }

    private func subIsland(_ row: Int, _ col: Int, _ seen: inout[[Bool]]) -> Bool {
        var res = true

        var queue = [(row: Int, col: Int)]()
        queue.insert((row, col), at: 0)

        seen[row][col] = true

        while !queue.isEmpty {
            let cell = queue.removeLast()

            if g1[cell.row][cell.col] != 1 {
                res = false
            }

            for dir in dirs {
                let nextRow = cell.row + dir.row
                let nextCol = cell.col + dir.col

                if nextRow >= 0, nextCol >= 0, nextRow < g2.count, nextCol < g2[0].count,
                     !seen[nextRow][nextCol], g2[nextRow][nextCol] == 1 {
                        queue.insert((nextRow, nextCol), at: 0)
                        seen[nextRow][nextCol] = true
                }
            }
        }

        return res
    }
}
