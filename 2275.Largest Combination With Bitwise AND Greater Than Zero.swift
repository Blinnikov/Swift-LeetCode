class Solution {
    func largestCombination(_ candidates: [Int]) -> Int {
        var bits = Array(repeating: 0, count: 24)

        for i in 0..<24 {
            for c in candidates {
                if c & (1 << i) != 0 {
                    bits[i] += 1
                }
            }
        }

        return bits.max()!
    }
}
