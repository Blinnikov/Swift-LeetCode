class Solution {
    private let mod = 1000000007

    func checkRecord(_ n: Int) -> Int {
        var dp = [[1, 1, 1], [1, 1, 1]]

        for i in 1...n {
            var tmp = [[0, 0, 0], [0, 0, 0]]

            for a in 0..<2 {
                for l in 0..<3 {
                    tmp[a][l] += dp[a][2]

                    if a > 0 {
                        tmp[a][l] = (tmp[a][l] + dp[a - 1][2]) % mod
                    }

                    if l > 0 {
                        tmp[a][l] = (tmp[a][l] + dp[a][l - 1]) % mod
                    }
                }
            }

            dp = tmp
        }

        return dp[1][2]
    }
}
