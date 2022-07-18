class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfitAfterFirstRound = Array(repeating: 0, count: prices.count)
        
        var minPrice = Int.max
        var maxProfit = Int.min
        
        for i in 0..<prices.count {
            minPrice = min(minPrice, prices[i])
            maxProfit = max(maxProfit, prices[i] - minPrice)
            maxProfitAfterFirstRound[i] = maxProfit
        }
        
        // print(maxProfitAfterFirstRound)
        
        var maxPrice = Int.min
        var maxProfitTotal = 0
        
        for i in stride(from: prices.count-1, to: 0, by: -1) {
            maxPrice = max(maxPrice, prices[i])
            maxProfitTotal = max(maxProfitTotal, maxPrice - prices[i] + maxProfitAfterFirstRound[i])
            // print("At day \(i) price=\(prices[i]), secondProfit=\(maxPrice-prices[i])")
        }
        
        return maxProfitTotal
    }
}
