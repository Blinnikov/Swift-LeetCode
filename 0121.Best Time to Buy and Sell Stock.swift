class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var res = 0
        var minPrice = 100001
        
        for price in prices {
            res = max(res, price - minPrice)
            minPrice = min(minPrice, price)
        }
        
        return res
    }
}
