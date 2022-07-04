class Solution {
    func candy(_ ratings: [Int]) -> Int {
        var candies = Array(repeating: 1, count: ratings.count)
        var result = 0
        
        for idx in 1..<ratings.count {
            if ratings[idx] > ratings[idx-1] {
                candies[idx] = candies[idx-1] + 1
            }
        }
        
        result = candies[candies.count-1]
        
        for idx in stride(from: candies.count-2, through: 0, by: -1) {
            if ratings[idx] > ratings[idx+1] {
                candies[idx] = max(candies[idx], candies[idx+1] + 1)
            }
            result += candies[idx]
        }
        
        return result
    }
}
