class Solution {
    func maxIncreaseKeepingSkyline(_ grid: [[Int]]) -> Int {
        let n = grid.count;
        var rowMaximals = Array(repeating: 0, count: n)
        var colMaximals = Array(repeating: 0, count: n)

        for row in 0..<n {
            for col in 0..<n {
                rowMaximals[row] = max(rowMaximals[row], grid[row][col])
                colMaximals[col] = max(colMaximals[col], grid[row][col])
            }
        }

        var res = 0

        for row in 0..<n {
            for col in 0..<n {
                res += (min(rowMaximals[row], colMaximals[col]) - grid[row][col])
            }
        }

        return res
    }
}
