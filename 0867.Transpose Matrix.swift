class Solution {
    func transpose(_ matrix: [[Int]]) -> [[Int]] {
        let m = matrix.count
        let n = matrix[0].count
        
        var result = Array(repeating: Array(repeating: 0, count: m), count: n)
        
        for i in 0..<m {
            for j in 0..<n {
                result[j][i] = matrix[i][j]
            }
        }
        
        return result
    }
}
