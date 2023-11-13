class Solution {
    func sortVowels(_ s: String) -> String {
        var chars = Array(s)

        var vowels = [Character]()
        var positions = [Int]()

        for i in 0..<chars.count {
            let ch = chars[i]

            if isVowel(ch) {
                vowels.append(ch)
                positions.append(i)
            }
        }

        vowels.sort()

        for i in 0..<positions.count {
            chars[positions[i]] = vowels[i]
        }

        return String(chars)
    }

    private func isVowel(_ ch: Character) -> Bool {
        ch == "a" || ch == "A" ||
        ch == "e" || ch == "E" ||
        ch == "i" || ch == "I" ||
        ch == "o" || ch == "O" ||
        ch == "u" || ch == "U"
    }
}
