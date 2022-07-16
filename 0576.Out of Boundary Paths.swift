class Solution {
    func findPaths(_ m: Int, _ n: Int, _ maxMove: Int, _ startRow: Int, _ startColumn: Int) -> Int {
        var M = 1000000007;
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        dp[startRow][startColumn] = 1
        
        var count = 0
        
        for moves in 1...maxMove {
            var temp = Array(repeating: Array(repeating: 0, count: n), count: m)
            
            for i in 0..<m {
                for j in 0..<n {
                    if i == m - 1 {
                        count = (count + dp[i][j]) % M
                    }
                    
                    if j == n - 1 {
                        count = (count + dp[i][j]) % M
                    }
                    
                    if i == 0 {
                        count = (count + dp[i][j]) % M
                    }
                    
                    if j == 0 {
                        count = (count + dp[i][j]) % M
                    }
                  
                    temp[i][j] = (
                      ((i > 0 ? dp[i - 1][j] : 0) + (i < m - 1 ? dp[i + 1][j] : 0)) % M +
                      ((j > 0 ? dp[i][j - 1] : 0) + (j < n - 1 ? dp[i][j + 1] : 0)) % M
                    ) % M
                }
            }

            dp = temp;
        }
        
        return count
    }
}
