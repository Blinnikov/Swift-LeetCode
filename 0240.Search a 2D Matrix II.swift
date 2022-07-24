class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count, n = matrix[0].count
        var row = 0, col = n-1
        
        while row < m && col >= 0 {
            if matrix[row][col] == target {
                return true
            } else if matrix[row][col] < target {
                row += 1
            } else if matrix[row][col] > target {
                col -= 1
            }
        }
        
        return false
    }
}
