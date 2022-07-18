class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var minBuy = 0
        var maxSell = 0
        var profit = 0
        
        var i = 0
        while i < prices.count-1 {
            while i < prices.count-1 && prices[i] >= prices[i+1] {
                i += 1
            }
            minBuy = prices[i]

            while i < prices.count-1 && prices[i] < prices[i+1] {
                i += 1
            }
            maxSell = prices[i]

            profit += (maxSell - minBuy)
        }
        
        return profit
    }
}
