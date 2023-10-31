class Solution {
    func findArray(_ pref: [Int]) -> [Int] {
        var res = pref

        for i in stride(from: pref.count - 1, to: 0, by: -1) {
            res[i] ^= res[i - 1]
        }

        return res
    }
}
