class Solution {
    private let a = Character("a").asciiValue!

    private var dp = Array(repeating: 0, count: 26)

    func longestIdealString(_ s: String, _ k: Int) -> Int {
        var chars = Array(s)
        var res = 0

        for i in 0..<chars.count {
            let ch = chars[i]
            let idx = charToInt(ch)

            let lo = max(0, idx - k)
            let hi = min(25, idx + k)

            for j in lo...hi {
                dp[idx] = max(dp[idx], dp[j])
            }

            dp[idx] += 1
            res = max(res, dp[idx])
        }

        return res
    }

    private func charToInt(_ ch: Character) -> Int {
        return Int(ch.asciiValue! - a)
    }
}
