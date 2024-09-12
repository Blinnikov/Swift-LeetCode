class Solution {
    func countConsistentStrings(_ allowed: String, _ words: [String]) -> Int {
        var set = Set(allowed)

        var res = 0

        outer: for w in words {
            for ch in w {
                if !set.contains(ch) {
                    continue outer
                }
            }

            res += 1
        }

        return res
    }
}
