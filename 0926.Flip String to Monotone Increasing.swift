class Solution {
    func minFlipsMonoIncr(_ s: String) -> Int {
        var chars = Array(s)
        var ones = 0, res = 0
        for i in 0..<chars.count {
            if chars[i] == "0" {
                res = min(res + 1, ones)
            } else {
                ones += 1
            }
        }

        return res
    }
}
