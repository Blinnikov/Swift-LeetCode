class Solution {

    private let vowels: Set<Character> = ["a", "A", "e", "E", "i", "I", "o", "O", "u", "U"]

    func reverseVowels(_ s: String) -> String {
        var chars = Array(s)

        var left = 0
        var right = s.count - 1

        while left < right {
            // print("Iteration \(left) \(right)")
            while left < right, !isVowel(chars[left]) {
                left += 1
            }

            while left < right, !isVowel(chars[right]) {
                right -= 1
            }

            chars.swapAt(left, right)
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
