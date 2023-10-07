class Solution {
    private let mod = 1_000_000_007

    private var dp = [[[Int]]]()

    func numOfArrays(_ n: Int, _ m: Int, _ k: Int) -> Int {
        dp = Array(
            repeating: Array(
                repeating: Array(
                    repeating: -1, count: k + 1
                ), count: m + 1
            ), count: n + 1)

            return dfs(n, m, k, 0, 0, 0)
    }

    func dfs(_ n: Int, _ m: Int, _ k: Int, _ i: Int, _ curMax: Int, _ curCost: Int) -> Int {
        if (i == n) {
            return k == curCost ? 1 : 0
        }

        if dp[i][curMax][curCost] != -1 {
            return dp[i][curMax][curCost]
        }

        var res = 0

        res += curMax * dfs(n, m, k, i + 1, curMax, curCost) % mod

        if curCost + 1 <= k, curMax < m {
            for num in (curMax + 1)...m {
                res += dfs(n, m, k, i + 1, num, curCost + 1)
                res %= mod
            }
        }

        dp[i][curMax][curCost] = res
        
        return res
    }
}
