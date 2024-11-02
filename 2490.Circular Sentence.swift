class Solution {
    func isCircularSentence(_ sentence: String) -> Bool {
        var chars = Array(sentence)

        if chars.first! != chars.last! {
            return false
        }

        for i in 0..<chars.count {
            if chars[i] != " " {
                continue
            }

            if i < 1 || i > chars.count - 2 || chars[i - 1] != chars[i + 1] {
                return false
            }
        }

        return true
    }
}
