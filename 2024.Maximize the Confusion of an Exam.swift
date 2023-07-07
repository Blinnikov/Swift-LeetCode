class Solution {
    func maxConsecutiveAnswers(_ answerKey: String, _ k: Int) -> Int {
        var chars = Array(answerKey)
        var map = [Character:Int]()

        var res = 0
        var count = 0

        for (idx, ch) in chars.enumerated() {
            map[ch] = map[ch, default: 0] + 1
            count = max(count, map[ch]!)

            if res - count < k {
                res += 1
            } else {
                var prevChar = chars[idx - res]
                map[prevChar] = map[prevChar, default: 0] - 1
            }
        }

        return res
    }
}
