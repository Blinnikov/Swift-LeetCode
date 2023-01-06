class Solution {
    func maxIceCream(_ costs: [Int], _ coins: Int) -> Int {
        var coins = coins
        let costs = costs.sorted()

        var bars = 0
        var idx = 0
        while idx < costs.count, coins >= costs[idx] {
            bars += 1
            coins -= costs[idx]
            idx += 1
        }
        
        return bars
    }
}
