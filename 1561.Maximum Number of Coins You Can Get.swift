class Solution {
    func maxCoins(_ piles: [Int]) -> Int {
        let piles = Array(piles.sorted()[(piles.count / 3)...])

        var sum = 0

        for i in stride(from: 0, to: piles.count, by: 2) {
            sum += piles[i]
        }

        return sum
    }
}
