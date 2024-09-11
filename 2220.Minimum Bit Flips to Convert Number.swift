class Solution {
    func minBitFlips(_ start: Int, _ goal: Int) -> Int {
        var x = start ^ goal
        var res = 0

        while x != 0 {
            res += x & 1

            x >>= 1
        }

        return res
    }
}
