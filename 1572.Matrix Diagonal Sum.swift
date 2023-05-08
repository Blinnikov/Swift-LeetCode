class Solution {
    func diagonalSum(_ mat: [[Int]]) -> Int {
        var sum = 0

        for i in 0..<mat.count {
            let pdCol = i
            let pdRow = i
            let primaryDiagonalEl = mat[pdCol][pdRow]

            let sdCol = i
            let sdRow = mat.count - 1 - i
            let secondaryDiagonalEl = mat[sdCol][sdRow]

            sum += primaryDiagonalEl + secondaryDiagonalEl
            
            if pdCol == sdCol && pdRow == sdRow {
                sum -= secondaryDiagonalEl
            }

            // print(primaryDiagonalEl, secondaryDiagonalEl)
        }

        return sum
    }
}
