
class NumMatrix {
    private var psa: [[Int]]

    init(_ matrix: [[Int]]) {
        // Helper.printMatrix(matrix)
        
        self.psa = Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count)
        psa[0][0] = matrix[0][0]
        
        for j in 1..<matrix[0].count {
            psa[0][j] = psa[0][j-1] + matrix[0][j]
        }
        
        for i in 1..<matrix.count {
            psa[i][0] = psa[i-1][0] + matrix[i][0]
        }
        
        for i in 1..<matrix.count {
            for j in 1..<matrix[0].count {
                psa[i][j] = matrix[i][j] + psa[i-1][j] + psa[i][j-1] - psa[i-1][j-1]
            }
        }
        
        // Helper.printMatrix(psa)
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        let sum = psa[row2][col2]
        let leftBottom = col1 > 0 ? psa[row2][col1-1] : 0
        let rightUpper = row1 > 0 ? psa[row1-1][col2] : 0
        let diagonal = row1 > 0 && col1 > 0 ? psa[row1-1][col1-1] : 0
        
        return sum + diagonal - leftBottom - rightUpper
    }
}

class Helper {
    static func printMatrix(_ matrix: [[Int]]) {
        var res = ""
        for row in 0..<matrix.count {
            var rowStr = "["
            for col in 0..<matrix[0].count {
                rowStr += " \(matrix[row][col]),"
            }
            rowStr = String(rowStr.dropLast())
            rowStr += "]\n"
            res += rowStr
        }
        
        print(res)
    }
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */
