class Solution {
    private let dirs = [(-1, 0), (0, 1), (1, 0), (0, -1)]

    private var chars = [Character]()
    private var board = [[Character]]()
    private var visited = [[Bool]]()
    private var rows = 0
    private var cols = 0

    func exist(_ board: [[Character]], _ word: String) -> Bool {
        self.rows = board.count
        self.cols = board[0].count
        self.chars = Array(word)
        self.board = board
        self.visited = Array(repeating: Array(repeating: false, count: cols), count: rows)

        for row in 0..<rows {
            for col in 0..<cols {
                if board[row][col] == chars[0] {
                    visited[row][col] = true
                    if backtrack(row, col, 0) {
                        return true
                    }
                    visited[row][col] = false
                }
            }
        }

        return false
    }

    private func backtrack(_ row: Int, _ col: Int, _ idx: Int) -> Bool {
        if idx == chars.count - 1 {
            return true
        }

        var candidates = [(Int, Int)]()
        for dir in dirs {
            let newRow = row + dir.0
            let newCol = col + dir.1

            if newRow < 0 || newRow >= rows || newCol < 0 || newCol >= cols || visited[newRow][newCol] || board[newRow][newCol] != chars[idx + 1] {
                continue
            }

            candidates.append((newRow, newCol))
        }

        if candidates.count == 0 {
            return false
        }

        for c in candidates {
            visited[c.0][c.1] = true
            if backtrack(c.0, c.1, idx + 1) {
                return true
            }
            visited[c.0][c.1] = false
        }

        return false
    }
}
