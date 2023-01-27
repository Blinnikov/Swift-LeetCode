class Solution {
    func findAllConcatenatedWordsInADict(_ words: [String]) -> [String] {
        var dict = Set(words)
        var res = [String]()

        for w in words {
            // print("Word: \(w)")
            let chars = Array(w)
            let n = chars.count
            var dp = Array(repeating: false, count: n + 1)
            dp[0] = true

            for i in 1...n {
                var j = (i == n ? 1 : 0)
                while !dp[i], j < i {
                    // print(j,i)
                    let substr = String(chars[j..<i])
                    // print(substr)
                    dp[i] = dp[j] && dict.contains(substr)
                    j += 1
                }
            }

            if dp[n] {
                // print("--> Appending \(w)")
                res.append(w)
            }
            // print("\n")
        }
        return res   
    }
}
