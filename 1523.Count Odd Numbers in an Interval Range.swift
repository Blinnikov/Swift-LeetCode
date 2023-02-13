class Solution {
    func countOdds(_ low: Int, _ high: Int) -> Int {
        // Second - optimized
        let diff = Double(high - low + (low & 1))
        return Int(ceil(diff / 2.0))

        // First variant
        var res = 0

        for num in low...high {
            if num & 1 == 1 {
                res += 1
            }
        }

        return res
    }
}
