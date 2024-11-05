class Solution {
    func minChanges(_ s: String) -> Int {
        let chars = Array(s)
        var res = 0

        for i in stride(from: 0, to: chars.count, by: 2) {
            if chars[i] != chars[i + 1] {
                res += 1
            }
        }

        return res
    }
}
