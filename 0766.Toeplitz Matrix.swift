class Solution {
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        let rows = matrix.count, cols = matrix[0].count
        
        if rows == 1 || cols == 1 {
            return true
        }
        
        for r in 1..<rows {
            for c in 1..<cols {
                if matrix[r][c] != matrix[r-1][c-1] {
                    return false
                }
            }
        }
        
        return true
    }
}
