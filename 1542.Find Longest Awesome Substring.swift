class Solution {
    func longestAwesome(_ s: String) -> Int {
        var maskFirstIdx = Array(repeating: s.count, count: 1024) // 2 ^ 10
        maskFirstIdx[0] = -1

        var currentMask = 0
        var res = 0

        var chars = Array(s)

        for i in 0..<chars.count {
            let num = chars[i].wholeNumberValue!
            let maskForNum = 1 << num
            currentMask ^= maskForNum

            res = max(res, i - maskFirstIdx[currentMask])

            for n in 0...9 {
                let currentMaskWithAdditionalNum = currentMask ^ (1 << n)
                res = max(res, i - maskFirstIdx[currentMaskWithAdditionalNum])
            }

            maskFirstIdx[currentMask] = min(maskFirstIdx[currentMask], i)
        }

        return res
    }
}
