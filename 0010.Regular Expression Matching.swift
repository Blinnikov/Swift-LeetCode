class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        var dp = Array(repeating: Array(repeating: false, count: p.count + 1), count: s.count + 1)
        dp[0][0] = true

        let charsS = Array(s)
        let charsP = Array(p)

        for i in 0..<charsP.count {
            if charsP[i] == "*" && dp[0][i - 1] {
                dp[0][i + 1] = true
            }
        }
        
        for i in 0..<charsS.count {
            for j in 0..<charsP.count {
                if charsP[j] == "." {
                    dp[i + 1][j + 1] = dp[i][j]
                }

                if charsP[j] == charsS[i] {
                    dp[i + 1][j + 1] = dp[i][j]
                }

                if charsP[j] == "*" {
                    if charsP[j - 1] != charsS[i] && charsP[j - 1] != "." {
                        dp[i + 1][j + 1] = dp[i + 1][j - 1]
                    } else {
                        dp[i + 1][j + 1] = dp[i + 1][j] || dp[i][j + 1] || dp[i + 1][j - 1]
                    }
                }
            }
        }

        return dp[charsS.count][charsP.count]

        // return isMatch1(Array(s), Array(p))
    }

    // private func isMatch1(_ sChars: Array<Character>, _ pChars: Array<Character>) -> Bool {
    //     if pChars.isEmpty {
    //         return sChars.isEmpty
    //     }

    //     // print("Calc 1st match")
    //     // print(sChars.isEmpty, pChars, sChars, pChars[0] == sChars[0])
    //     let firstMatch = (!sChars.isEmpty && (pChars[0] == sChars[0] || pChars[0] == "."))
    //     // print("First match \(firstMatch)")

    //     if pChars.count >= 2 && pChars[1] == "*" {
    //         return isMatch(sChars, Array(pChars[2...])) || (firstMatch && isMatch(Array(sChars[1...]), pChars))
    //     } else {
    //         return firstMatch && isMatch(Array(sChars[1...]), Array(pChars[1...]))
    //     }
    // }
}
