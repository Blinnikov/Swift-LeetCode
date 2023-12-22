class Solution {
    func maxScore(_ s: String) -> Int {
        var chars = Array(s)
        var ps = Array(repeating: 0, count: s.count + 1)

        for i in stride(from: ps.count - 2, through: 0, by: -1) {
            ps[i] = ps[i + 1] + (chars[i] == "1" ? 1 : 0)
        }

        var zeros = 0
        var res = 0

        for i in 0..<chars.count - 1 {
            if chars[i] == "0" {
                zeros += 1
            }

            res = max(res, zeros + ps[i + 1])
        }

        return res
    }
}
