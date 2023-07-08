class Solution {
    func putMarbles(_ weights: [Int], _ k: Int) -> Int {
        var sumOfPairs = Array(repeating: 0, count: weights.count - 1)
        
        for i in 0..<sumOfPairs.count {
            sumOfPairs[i] = weights[i] + weights[i + 1]
        }

        sumOfPairs.sort()

        var res = 0

        for i in 0..<(k - 1) {
            res += sumOfPairs[sumOfPairs.count - 1 - i] - sumOfPairs[i]
        }

        return res
    }
}
