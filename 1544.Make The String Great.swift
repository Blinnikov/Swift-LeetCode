class Solution {
    func makeGood(_ s: String) -> String {
        var stack = [Character]()
        var chars = Array(s)

        var i = 0
        while i < chars.count {
            if i < chars.count - 1, areBad(chars[i], chars[i + 1]) {
                i += 2
                continue
            }

            stack.append(chars[i])

            while !stack.isEmpty && (stack.count >= 2 && areBad(stack[stack.count - 1], stack[stack.count - 2])) {
                stack.removeLast()
                stack.removeLast()
            }

            i += 1
        }

        return String(stack)
    }

    private func areBad(_ ch1: Character, _ ch2: Character) -> Bool {
        if ch1.isLowercase && ch2.isUppercase {
            return ch1 == Character(ch2.lowercased())
        }

        if ch1.isUppercase && ch2.isLowercase {
            return Character(ch1.lowercased()) == ch2
        }

        return false
    }
}
