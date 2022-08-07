class Solution {
    private let a = 0, e = 1, i = 2, o = 3, u = 4
    private let base: Decimal = 1000000007
    
    func countVowelPermutation(_ n: Int) -> Int {
        
        var dp: [[Decimal]] = Array(repeating: Array(repeating: 0, count: n), count: 5)
        dp[a][0] = 1
        dp[e][0] = 1
        dp[i][0] = 1
        dp[o][0] = 1
        dp[u][0] = 1
        
        if n > 1 {
            for j in 1..<n {
                dp[a][j] = (dp[e][j-1] + dp[i][j-1] + dp[u][j-1]).mod(base)
                dp[e][j] = (dp[a][j-1] + dp[i][j-1]).mod(base)
                dp[i][j] = (dp[e][j-1] + dp[o][j-1]).mod(base)
                dp[o][j] = (dp[i][j-1]).mod(base)
                dp[u][j] = (dp[i][j-1] + dp[o][j-1]).mod(base)
            }
        }
        
        let sum = (dp[a][n-1] + dp[e][n-1] + dp[i][n-1] + dp[o][n-1] + dp[u][n-1]).mod(base)
        return Int(NSDecimalNumber(decimal: sum))
    }
}

extension Decimal {
    func mod(_ b: Decimal) -> Decimal {
        var d = self/(b)
        var f : Decimal = 0
        NSDecimalRound(&f, &d, 0, .down)
        return self-(b*(f))
    }    
}
