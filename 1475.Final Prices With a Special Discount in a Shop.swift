class Solution {
    func finalPrices(_ prices: [Int]) -> [Int] {
        var res = Array(repeating: 0, count: prices.count)

        for i in 0..<prices.count {
            res[i] = prices[i]

            for j in stride(from: i + 1, to: prices.count, by: 1) {
                if prices[j] <= prices[i] {
                    res[i] -= prices[j]
                    break
                }
            }
        }

        return res
    }
}
