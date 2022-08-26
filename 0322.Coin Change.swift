class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {   
        let valueBiggerThanNeeded = amount + 1
        var amounts = Array(repeating: valueBiggerThanNeeded, count: amount + 1)
        amounts[0] = 0
        
        for coin in coins {
            // print("Coin: \(coin)")
            for i in stride(from: coin, to: amount + 1, by: 1) {
                amounts[i] = min(amounts[i], amounts[i - coin] + 1)
                // print(i,  amounts)
            }
            // print("\n")
        }
        
        return amounts[amount] <= amount ? amounts[amount] : -1
    }
}
