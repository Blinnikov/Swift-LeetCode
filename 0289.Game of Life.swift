class Solution {
    private let dead = 0
    private let live = 1
    private let reproduced = 2
    private let survived = 3
    
    func gameOfLife(_ board: inout [[Int]]) {
        for r in 0..<board.count {
            for c in 0..<board[0].count {
                let l = liveCells(board, r, c)
                
                if board[r][c] == live && (l == 2 || l == 3) {
                    board[r][c] = survived
                }
                
                if board[r][c] == dead && l == 3 {
                    board[r][c] = reproduced
                }
            }
        }
        
        for r in 0..<board.count {
            for c in 0..<board[0].count {
                board[r][c] >>= 1
            }
        }
    }
    
    private func liveCells(_ board: [[Int]], _ r: Int, _ c: Int) -> Int {
        var result = 0
        
        // left top
        if r > 0 && c > 0 {
            result += board[r-1][c-1] & 1
        }
        // top
        if r > 0 {
            result += board[r-1][c] & 1
        }
        // right top
        if r > 0 && c < board[0].count-1 {
            result += board[r-1][c+1] & 1
        }
        // right
        if c < board[0].count-1 {
            result += board[r][c+1] & 1
        }
        // right bottom
        if r < board.count-1 && c < board[0].count-1 {
            result += board[r+1][c+1] & 1
        }
        // bottom
        if r < board.count-1 {
            result += board[r+1][c] & 1
        }
        // left bottom
        if r < board.count-1 && c > 0 {
            result += board[r+1][c-1] & 1
        }
        // left
        if c > 0 {
            result += board[r][c-1] & 1
        }
        
        return result
    }
}
