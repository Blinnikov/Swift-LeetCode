class Solution {
    func stoneGameII(_ piles: [Int]) -> Int {
        var prefixSum = piles
        for i in stride(from: piles.count - 2, through: 0, by: -1) {
            prefixSum[i] += prefixSum[i + 1]
        }

        var memo = Array(repeating: Array(repeating: 0, count: piles.count), count: piles.count)

        return dfs(1, 0, prefixSum, &memo)
    }

    private func dfs(_ m: Int, _ p: Int, _ prefixSum: [Int], _ memo: inout[[Int]]) -> Int {
        if p + 2 * m >= prefixSum.count {
            return prefixSum[p]
        }

        if memo[p][m] > 0 {
            return memo[p][m]
        }

        var res = 0
        var stones = 0

        for i in 1...(2 * m) {
            stones = prefixSum[p] - prefixSum[p + i]
            res = max(res, stones + prefixSum[p + i] - dfs(max(i, m), p + i, prefixSum, &memo))
        }

        memo[p][m] = res

        return res
    }
}
