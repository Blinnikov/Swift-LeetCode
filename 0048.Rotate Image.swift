class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        
        for r in 0..<(n+1)/2 {
            for c in 0..<n/2 {
                let temp = matrix[n-1-c][r]
                matrix[n-1-c][r] = matrix[n-1-r][n-c-1]
                matrix[n-1-r][n-c-1] = matrix[c][n-1-r]
                matrix[c][n-1-r] = matrix[r][c]
                matrix[r][c] = temp
            }
        }
    }
    
    func rotateWithNewMatrix(_ matrix: inout [[Int]]) {
        let rows = matrix.count
        let cols = matrix[0].count
        
        var result = Array(repeating: Array(repeating: 0, count: cols), count: rows)
        
        for r in 0..<rows {
            for c in 0..<cols {
                result[r][c] = matrix[cols-1-c][r]
            }
        }
        
        matrix = result
    }
}
