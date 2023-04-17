class Solution {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        let localMax = candies.max()!

        var result = Array(repeating: false, count: candies.count)

        for i in 0..<candies.count {
            if candies[i] + extraCandies >= localMax {
                result[i] = true
            }
        }

        return result
    }
}
