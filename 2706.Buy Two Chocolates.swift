class Solution {
    func buyChoco(_ prices: [Int], _ money: Int) -> Int {
        let prices = prices.sorted()
        let candies = prices[0] + prices[1]

        return candies <= money ? money - candies : money
    }
}
