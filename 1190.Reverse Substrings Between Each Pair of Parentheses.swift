class Solution {
    private var idx = 0
    private var chars = [Character]()

    func reverseParentheses(_ s: String) -> String {
        chars = Array(s)

        return String(traverse())
    }

    private func traverse() -> [Character] {
        var res = [Character]()

        while idx < chars.count {
            let ch = chars[idx]

            idx += 1

            if ch == "(" {
                res += traverse()
            } else if ch == ")" {
                return res.reversed()
            } else {
                res.append(ch)
            }
        }

        return res
    }
}
