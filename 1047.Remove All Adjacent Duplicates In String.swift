class Solution {
    func removeDuplicates(_ s: String) -> String {
        var stack = [Character]()
        var chars = Array(s)

        for ch in chars {
            if stack.isEmpty {
                stack.append(ch)
                continue
            }

            if stack.last == ch {
                stack.removeLast()
                continue
            } else {
                stack.append(ch)
            }
        }

        return String(stack)
    }
}
