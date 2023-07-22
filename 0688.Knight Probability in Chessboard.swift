class Solution {
    private let directions = [
        (-2, -1), (-1, -2), (1, -2), (2, -1),
        (2, 1), (1, 2), (-1, 2), (-2, 1)
        ]

    private var memo = [[[Double]]]()
    
    func knightProbability(_ n: Int, _ k: Int, _ row: Int, _ column: Int) -> Double {
        memo = Array(
            repeating: Array(repeating: Array(repeating: 0.0, count: k + 1), count: n),
            count: n
        )

        return traverse(n, k, row, column)
    }

    private func traverse(_ n: Int, _ k: Int, _ row: Int, _ col: Int) -> Double {
        if row < 0 || row > n - 1 {
            return 0
        }

        if col < 0 || col > n - 1 {
            return 0
        }

        if k == 0 {
            return 1
        }

        if memo[row][col][k] != 0 {
            return memo[row][col][k]
        }

        var res = 0.0

        for i in 0..<directions.count {
            let nextRow = row + directions[i].0
            let nextCol = col + directions[i].1

            res += 0.125 * traverse(n, k - 1, nextRow, nextCol)
        }

        memo[row][col][k] = res

        return res
    }
}
