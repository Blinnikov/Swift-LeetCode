class Solution {
    func profitableSchemes(_ n: Int, _ minProfit: Int, _ group: [Int], _ profit: [Int]) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: minProfit + 1)
        dp[0][0] = 1
        
        var result = 0

        for idx in 0..<group.count {

            let g = group[idx]
            let p = profit[idx]

            for i in stride(from: minProfit, through: 0, by: -1) {
                for j in stride(from: n - g, through: 0, by: -1) {
                    dp[min(i + p, minProfit)][j + g] = (dp[min(i + p, minProfit)][j + g] + dp[i][j]) % 1000000007
                }
            }
        }

        for el in dp[minProfit] {
            result = (result + el) % 1000000007
        }

        return result
    }
}
