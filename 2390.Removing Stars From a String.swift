class Solution {
    func removeStars(_ s: String) -> String {
        var chars = Array(s)
        var stack = [Character]()

        for ch in chars {
            if ch == "*" {
                if !stack.isEmpty {
                    stack.removeLast()
                }
            } else {
                stack.append(ch)
            }
        }

        return String(stack)
    }
}
