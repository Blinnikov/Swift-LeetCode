class Solution {
    func maxValueOfCoins(_ piles: [[Int]], _ k: Int) -> Int {
        var memo = Array(repeating: Array(repeating: -1, count: k + 1), count: piles.count + 1)

        return dp(piles, &memo, 0, k)
    }

    private func dp(_ piles: [[Int]], _ memo: inout[[Int]], _ i: Int, _ k: Int) -> Int {
        if k == 0 || piles.count == i {
            return 0
        }

        if memo[i][k] != -1 {
            return memo[i][k]
        }

        var result = dp(piles, &memo, i + 1, k)
        var current = 0

        for j in 0..<min(piles[i].count, k) {
            current += piles[i][j]
            result = max(result, current + dp(piles, &memo, i + 1, k - j - 1))
        }

        memo[i][k] = result
        
        return result
    }
}
