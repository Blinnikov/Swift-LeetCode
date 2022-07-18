class Solution {
    func numSubmatrixSumTarget(_ matrix: [[Int]], _ target: Int) -> Int {
        var matrix = matrix
        var map: [Int:Int]
        
        // Create in-place prefix sum for each row
        let rows = matrix.count
        let cols = matrix[0].count
                
        for row in 0..<rows {
            for col in 1..<cols {
                matrix[row][col] += matrix[row][col-1]
            }
        }
        
        // Calculate all submatrices
        var res = 0
        for colStart in 0..<cols {
            for colEnd in colStart..<cols {
                map = [:]
                map[0] = 1
                var sum = 0
                
                for row in 0..<rows {
                    sum += matrix[row][colEnd] - (colStart > 0 ? matrix[row][colStart-1] : 0)
                    res += (map[sum-target] ?? 0)
                    map[sum] = (map[sum] ?? 0) + 1
                }
            }
        }
        
        return res
    }
}

