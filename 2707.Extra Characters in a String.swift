class Solution {
    func minExtraChar(_ s: String, _ dictionary: [String]) -> Int {
        let chars = Array(s)

        var dp = Array(repeating: s.count + 1, count: s.count + 1)
        dp[0] = 0

        let set = Set(dictionary)

        for i in 1...s.count {
            dp[i] = dp[i - 1] + 1

            for len in 1...i {
                let startIdx = i - len
                let endIdx = i
                let subStr = String(chars[startIdx..<endIdx])

                if set.contains(subStr) {
                    dp[i] = min(dp[i], dp[i - len])
                }
            }
        }

        return dp[s.count]
    }
}
