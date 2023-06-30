class Solution {
    private let directions = [0, 1, 0, -1]

    private var emptyMatrix = [[Int]]()
    private var cells = [[Int]]()

    func latestDayToCross(_ row: Int, _ col: Int, _ cells: [[Int]]) -> Int {
        self.emptyMatrix = Array(repeating: Array(repeating: 0, count: col), count: row)
        self.cells = cells

        var res = 0
        var lo = 1
        var hi = cells.count

        while lo <= hi {
            let mid = lo + (hi - lo) / 2

            if canCross(at: mid) {
                // print("Can cross at day \(mid)")
                res = mid
                lo = mid + 1
            } else {
                // print("Cannot cross at day \(mid)")
                hi = mid - 1
            }
        }

        return res
    }

    private func canCross(at day: Int) -> Bool {
        var matrix = emptyMatrix

        // fill matrix with water at `day`
        for i in 0..<day {
            let rowIdx = cells[i][0] - 1
            let colIdx = cells[i][1] - 1
            
            matrix[rowIdx][colIdx] = 1
        }

        // print("Matrix at day \(day):\n\(matrix)")

        var queue = [(row: Int, col: Int)]()

        for col in 0..<matrix[0].count {
            if matrix[0][col] != 0 {
                continue
            }

            queue.insert((0, col), at: 0)
            matrix[0][col] = 1
        }

        while !queue.isEmpty {
            let cell = queue.removeLast()
            // print("Getting from queue \(cell)")

            if cell.row == matrix.count - 1 {
                return true
            }

            for i in 0..<directions.count {
                let nextRow = cell.row + directions[i]
                let nextCol = cell.col + directions[(i + 1) % directions.count]

                // print("Next cell \((nextRow, nextCol))")

                if nextRow < 0 || nextRow == matrix.count {
                    continue
                }

                if nextCol < 0 || nextCol == matrix[0].count {
                    continue
                }

                if matrix[nextRow][nextCol] == 1 {
                    continue
                }

                matrix[nextRow][nextCol] = 1

                queue.insert((nextRow, nextCol), at: 0)
            }
        }

        return false
    }
}
