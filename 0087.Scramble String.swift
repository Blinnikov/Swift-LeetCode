class Solution {
    func isScramble(_ s1: String, _ s2: String) -> Bool {
        let chars1 = Array(s1)
        let chars2 = Array(s2)
        let n = chars1.count

        var dp = Array(
            repeating: Array(repeating: Array(repeating: false, count: n + 1), count: n),
            count: n
        )

        for substrLen in 1...n {
            var strStartIdx1 = 0
            while (strStartIdx1 + substrLen) <= n {

                var strStartIdx2 = 0
                while (strStartIdx2 + substrLen) <= n {

                    if substrLen == 1 {
                        dp[strStartIdx1][strStartIdx2][substrLen] = chars1[strStartIdx1] == chars2[strStartIdx2]
                    } else {
                        for splitIdx in 1..<substrLen {
                            if dp[strStartIdx1][strStartIdx2][substrLen] {
                                continue
                            }

                            dp[strStartIdx1][strStartIdx2][substrLen] = 
                            (dp[strStartIdx1][strStartIdx2][splitIdx] && dp[strStartIdx1 + splitIdx][strStartIdx2 + splitIdx][substrLen - splitIdx]) 
                            ||
                            (dp[strStartIdx1][strStartIdx2 + substrLen - splitIdx][splitIdx] && dp[strStartIdx1 + splitIdx][strStartIdx2][substrLen - splitIdx])
                        }
                    }

                    strStartIdx2 += 1
                }

                strStartIdx1 += 1
            }
        }

        return dp[0][0][n]
    }
}
