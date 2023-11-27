class Solution {
    private let mod = 1_000_000_007

    func knightDialer(_ n: Int) -> Int {
        var possibleMoves = [
            [4, 6], // 0
            [6, 8], // 1
            [7, 9], // 2
            [4, 8], // 3
            [0, 3, 9], // 4
            [], // 5
            [0, 1, 7], // 6
            [2, 6], // 7
            [1, 3], // 8
            [2, 4] // 9
        ]

        var dp = Array(repeating: Array(repeating: 0, count: 10), count: n)

        for col in 0..<10 {
            dp[0][col] = 1
        }

        for i in 1..<n {
            for j in 0..<10 {
                for nextMove in possibleMoves[j] {
                    dp[i][j] = (dp[i][j] + dp[i - 1][nextMove]) % mod
                }
            }
        }

        // return dp[n - 1].reduce(0, +) % mod

        var res = 0

        for i in 0..<10 {
            res = (res + dp[n - 1][i]) % mod
        }

        return res
    }
}
