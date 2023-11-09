class Solution {
    private let mod = 1000000007

    func countHomogenous(_ s: String) -> Int {
        var res = 0
        var count = 0
        var chars = Array(s)
        var ch = Character("0")

        for i in 0..<chars.count {
            count = chars[i] == ch ? count + 1 : 1
            ch = chars[i]
            res = (res + count) % mod
        }


        return res
    }
}
