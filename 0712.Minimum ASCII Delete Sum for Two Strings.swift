class Solution {
    func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
        let chars1 = Array(s1)
        let chars2 = Array(s2)

        var dp = Array(repeating: Array(repeating: 0, count: chars2.count + 1), count: chars1.count + 1)

        for j in 1...chars2.count {
            dp[0][j] = dp[0][j - 1] + Int(chars2[j - 1].asciiValue!)
        }

        // print(dp)

        for i in 1...chars1.count {
            dp[i][0] = dp[i - 1][0] + Int(chars1[i - 1].asciiValue!)

            for j in 1...chars2.count {
                if chars1[i - 1] == chars2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    dp[i][j] = min(
                        dp[i - 1][j] + Int(chars1[i - 1].asciiValue!),
                        dp[i][j - 1] + Int(chars2[j - 1].asciiValue!)
                    )
                }
            }
        }

        // print(dp)

        return dp[chars1.count][chars2.count]
    }
}
