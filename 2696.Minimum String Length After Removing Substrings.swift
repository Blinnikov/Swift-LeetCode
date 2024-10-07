class Solution {
    func minLength(_ s: String) -> Int {
        var chars = Array(s)

        var stack = [Character]()

        for ch in chars {
            if stack.isEmpty {
                stack.append(ch)
                continue
            }

            if ch == "B", stack.last! == "A" {
                stack.removeLast()
            } else if ch == "D", stack.last! == "C" {
                stack.removeLast()
            } else {
                stack.append(ch)
            }
        }

        return stack.count
    }
}
