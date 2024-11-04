class Solution {
    func compressedString(_ word: String) -> String {
        let chars = Array(word)

        var res = ""
        var i = 0

        while i < chars.count {
            var count = 0

            let ch = chars[i]

            while i < chars.count, count < 9, chars[i] == ch {
                count += 1
                i += 1
            }

            res += "\(count)\(ch)"
        }

        return res
    }
}
