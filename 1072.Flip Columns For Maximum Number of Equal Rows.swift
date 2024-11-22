class Solution {
    func maxEqualRowsAfterFlips(_ matrix: [[Int]]) -> Int {
        var res = 0

        for row in matrix {
            var subRes = 0
            var flipped = Array(repeating: 0, count: matrix[0].count)

            for c in 0..<matrix[0].count {
                flipped[c] = 1 - row[c]
            }

            for rowToCompare in matrix {
                if rowToCompare == row || rowToCompare == flipped {
                    subRes += 1
                }
            }

            res = max(res, subRes)
        }

        return res   
    }
}
