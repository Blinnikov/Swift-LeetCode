class Solution {
    private let a = Character("a").asciiValue!

    func findTheLongestSubstring(_ s: String) -> Int {
        let charsMask = [1, 0, 0, 0, 2, 0, 0, 0, 4, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0]
                    //   a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u   v  w  x  y  z

        var maskFirstIdx = Array(repeating: -1, count: 32) // 2 ^ 5
        var currentMask = 0
        var res = 0

        var chars = Array(s)

        for i in 0..<chars.count {
            let idx = charToInt(chars[i])
            let maskForChar = charsMask[idx]
            currentMask ^= maskForChar

            if currentMask != 0, maskFirstIdx[currentMask] == -1 {
                maskFirstIdx[currentMask] = i
            }

            res = max(res, i - maskFirstIdx[currentMask])
        }

        return res
    }

    private func charToInt(_ ch: Character) -> Int {
        Int(ch.asciiValue! - a)
    }
}
