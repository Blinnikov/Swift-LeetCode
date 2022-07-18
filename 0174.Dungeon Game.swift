class Solution {
    func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        var rows = dungeon.count
        var cols = dungeon[0].count
        
        if rows == 1 && cols == 1 {
            return max(1 - dungeon[0][0], 1)
        }
        
        var dp = Array(repeating: Array(repeating: 0, count: cols), count: rows)
        dp[rows-1][cols-1] = max(1 - dungeon[rows-1][cols-1], 1)
        
        for j in stride(from: cols-2, through: 0, by: -1) {
            dp[rows-1][j] = max(dp[rows-1][j+1] - dungeon[rows-1][j], 1)
        }
        
        for i in stride(from: rows-2, through: 0, by: -1) {
            dp[i][cols-1] = max(dp[i+1][cols-1] - dungeon[i][cols-1], 1)
        }
        
        if rows == 1 || cols == 1 {
            return dp[0][0]
        }
        
        for i in stride(from: rows-2, through: 0, by: -1) {
            for j in stride(from: cols-2, through: 0, by: -1) {
                let fromBottom = max(dp[i+1][j] - dungeon[i][j], 1)
                let fromRight = max(dp[i][j+1] - dungeon[i][j], 1)
                dp[i][j] = min(fromBottom, fromRight)
            }
        }
        
        return dp[0][0]
    }
}
