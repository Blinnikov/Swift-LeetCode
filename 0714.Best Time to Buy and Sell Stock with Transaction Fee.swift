class Solution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        var sell = Array(repeating: 0, count: prices.count)
        var buy = Array(repeating: 0, count: prices.count)
        buy[0] = -prices[0]

        for i in 1..<prices.count {
            buy[i] = max(buy[i - 1], sell[i - 1] - prices[i])
            sell[i] = max(sell[i - 1], buy[i - 1] + prices[i] - fee)
        }

        return sell.last!
    }
}
