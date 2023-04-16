class Solution {
    private var charsCount: [[Int]] = [[Int]]()
    private var memo: [[Int]] = [[Int]]()

    func numWays(_ words: [String], _ target: String) -> Int {
        var target = Array(target)
        let wordLen = words[0].count

        memo = Array(repeating: Array(repeating: -1, count: target.count), count: wordLen)

        charsCount = Array(repeating: Array(repeating: 0, count: wordLen), count: 26)

        for word in words {
            let chars = Array(word)

            for i in 0..<chars.count {
                let charCode = Int(chars[i].asciiValue!) - 97
                charsCount[charCode][i] += 1
            }
        }

        return dp(0, 0, wordLen, target)
    }

    private func dp(_ i: Int, _ k: Int, _ wordLen: Int, _ target: [Character]) -> Int {
        if i == target.count {
            return 1
        }

        if k == wordLen {
            return 0
        }

        if memo[k][i] != -1 {
            return memo[k][i]
        }

        var res = dp(i, k + 1, wordLen, target)

        let charCode = Int(target[i].asciiValue!) - 97
        if charsCount[charCode][k] > 0 {
            res += dp(i + 1, k + 1, wordLen, target) * charsCount[charCode][k]
            res %= 1_000_000_007
        }

        memo[k][i] = res
        return res
    }
}
