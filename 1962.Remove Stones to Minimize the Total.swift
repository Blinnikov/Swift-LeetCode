// TLE 45/59
class Solution {
    func minStoneSum(_ piles: [Int], _ k: Int) -> Int {
        var piles = piles
        var k = k
        let n = piles.count

        while k > 0 {
            piles.sort()
            // print(piles)
            piles[n - 1] -= piles[n - 1] / 2
            // print(piles)
            k -= 1
        }

        return piles.reduce(0, +)
    }
}
