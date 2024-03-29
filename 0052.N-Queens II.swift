class Solution {
    private var result = 0
    
    func totalNQueens(_ n: Int) -> Int {
        var board: [[Character]] = Array(repeating: Array(repeating: ".", count: n), count: n)
        var queens = [(col: Int, row: Int)]()
        queens.reserveCapacity(n)
        
        tryPut(&board, 0, &queens)
        
        return result
    }
    
    private func tryPut(_ board: inout [[Character]], _ row: Int, _ queens: inout [(col: Int, row: Int)]) {
        if queens.count == board.count {
            result += 1
            return
        }
        
        for col in 0..<board[0].count {
            if canPut(col, row, queens) {
                queens.append((col, row))
                board[col][row] = "Q"
                tryPut(&board, row+1, &queens)
                queens.removeLast()
                board[col][row] = "."
            }
        }
    }
    
    private func canPut(_ col: Int, _ row: Int, _ queens: [(col: Int, row: Int)]) -> Bool {
        for queen in queens {
            if col == queen.col || row == queen.row || abs(col-queen.col) == abs(row-queen.row) {
                return false
            }
        }
        
        return true
    }
}
