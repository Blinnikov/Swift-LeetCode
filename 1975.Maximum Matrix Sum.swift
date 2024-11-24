class Solution {
    func maxMatrixSum(_ matrix: [[Int]]) -> Int {
        var res = 0
        var neg = 0
        var _min = Int.max

        for row in matrix {
            for n in row {
                let _abs = abs(n)
                res += _abs

                if n < 0 {
                    neg += 1
                }

                _min = min(_min, _abs)
            }
        }

        if neg & 1 == 1 {
            res -= 2 * _min
        }

        return res
    }
}
