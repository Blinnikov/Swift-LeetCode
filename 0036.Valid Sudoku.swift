class Solution {
    private var board = [[Character]]()
    
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        self.board = board
        
        for r in 0..<9 {
            if !isValid(row: r) {
                return false
            }
        }
        
        for c in 0..<9 {
            if !isValid(col: c) {
                return false
            }
        }
        
        for r in 0..<3 {
            for c in 0..<3 {
                if !isValidBox(r*3, c*3) {
                    return false
                }
            }
        }
        
        return true
    }
    
    private func isValid(row: Int) -> Bool {
        var seen = Array(repeating: false, count: 9)
        for c in 0..<9 {
            let ch = board[row][c]
            if ch != "." {
                if seen[ch.wholeNumberValue! - 1] {
                    return false
                } else {
                    seen[ch.wholeNumberValue! - 1] = true
                }
            }
        }
        return true
    }
    
    private func isValid(col: Int) -> Bool {
        var seen = Array(repeating: false, count: 9)
        for r in 0..<9 {
            let ch = board[r][col]
            if ch != "." {
                if seen[ch.wholeNumberValue! - 1] {
                    return false
                } else {
                    seen[ch.wholeNumberValue! - 1] = true
                }
            }
        }
        return true
    }
    
    private func isValidBox(_ row: Int, _ col: Int) -> Bool {
        var seen = Array(repeating: false, count: 9)
        for r in row..<row+3 {
            for c in col..<col+3 {
                let ch = board[r][c]
                if ch != "." {
                    if seen[ch.wholeNumberValue! - 1] {
                        return false
                    } else {
                        seen[ch.wholeNumberValue! - 1] = true
                    }
                }
            }
        }
        return true
    }
}
