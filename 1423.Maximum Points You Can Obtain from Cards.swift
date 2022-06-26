class Solution {
    func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
        let total = cardPoints.reduce(0, +)
        if k >= cardPoints.count {
            return total
        }
        
        var prefixSum = Array(repeating: 0, count: cardPoints.count+1)
        prefixSum[0] = 0
        for i in 0..<cardPoints.count {
            prefixSum[i+1] = cardPoints[i] + prefixSum[i]
        }
        
        var maxScore = 0
        var gap = cardPoints.count - k
        for i in 0...k {
            let score = prefixSum[i+gap] - prefixSum[i]
            maxScore = max(maxScore, total - score)
        }
        
        return maxScore
    }
}
