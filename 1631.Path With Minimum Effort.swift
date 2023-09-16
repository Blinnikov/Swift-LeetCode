class Solution {
    private let dirs = [0, 1, 0, -1, 0]

    private var heights = [[Int]]()
    var rows = 0
    var cols = 0

    func minimumEffortPath(_ heights: [[Int]]) -> Int {
        self.heights = heights
        self.rows = heights.count
        self.cols = heights[0].count

        var lo = 0
        var hi = 1_000_000

        while lo < hi {
            let effort = lo + (hi - lo) / 2
            // print(effort)

            if routeExists(effort) {
                hi = effort
            } else {
                lo = effort + 1
            }
        }

        return lo
    }

    private func routeExists(_ effort: Int) -> Bool {
        var queue = [(row: Int, col: Int)]()
        queue.append((0, 0))

        var visited: Set<Int> = [0]

        while !queue.isEmpty {
            let cell = queue.removeLast()

            if cell.row == rows - 1, cell.col == cols - 1 {
                return true
            }

            for i in 0..<4 {
                let row = cell.row + dirs[i]
                let col = cell.col + dirs[i + 1]

                if row >= 0, row < rows, col >= 0, col < cols, 
                    effort >= abs(heights[row][col] - heights[cell.row][cell.col]),
                    !visited.contains(row * cols + col) {
                        visited.insert(row * cols + col)
                        queue.insert((row, col), at: 0)
                    }
            }
        }

        return false
    }
}
