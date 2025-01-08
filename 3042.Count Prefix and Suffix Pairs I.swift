class Solution {
    func countPrefixSuffixPairs(_ words: [String]) -> Int {
        var res = 0

        for i in 0..<words.count - 1 {
            for j in (i + 1)..<words.count {
                if isPrefixAndSuffix(words[i], words[j]) {
                    res += 1
                }
            }
        }

        return res
    }

    private func isPrefixAndSuffix(_ s1: String, _ s2: String) -> Bool {
        if s1.count > s2.count {
            return false
        }

        return s2.hasSuffix(s1) && s2.hasPrefix(s1)
    }
}
