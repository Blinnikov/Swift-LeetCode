// TLE
class Solution {
    var psa = [[Int]]()
    
    func maxSumSubmatrix(_ matrix: [[Int]], _ k: Int) -> Int {
        let rows = matrix.count
        let cols = matrix[0].count
        psa = Array(repeating: Array(repeating: 0, count: cols+1), count: rows+1)
        
        // Creating prefix sum array 
        for r in 1...rows {
            for c in 1...cols {
                psa[r][c] = matrix[r-1][c-1]
                psa[r][c] += psa[r-1][c]
                psa[r][c] += psa[r][c-1]
                psa[r][c] -= psa[r-1][c-1]
            }
        }
        
        var res = Int.min
        // Loking through prefix sums array
        for row2 in 0...rows {
            for col2 in 0...cols {
                for row1 in 0..<row2 {
                    for col1 in 0..<col2 {
                        let sum = psa[row2][col2] - psa[row2][col1] - psa[row1][col2] + psa[row1][col1]
                        if sum <= k {
                            res = max(res, sum)
                        }
                    }
                }
            }
        }
        return res
    }
}
