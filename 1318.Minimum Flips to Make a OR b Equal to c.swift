class Solution {
    func minFlips(_ a: Int, _ b: Int, _ c: Int) -> Int {
        var res = 0

        for i in 1...32 {
            var aBit = 0
            var bBit = 0
            var cBit = 0

            if (a >> (i - 1)) & 1 == 1 {
                aBit = 1
            }

            if (b >> (i - 1)) & 1 == 1 {
                bBit = 1
            }

            if (c >> (i - 1)) & 1 == 1 {
                cBit = 1
            }

            if cBit == 0 && (aBit == 1 || bBit == 1) {
                res += (aBit + bBit)
            } else if cBit == 1 && aBit == 0 && bBit == 0 {
                res += 1
            }
        }

        return res
    }
}
