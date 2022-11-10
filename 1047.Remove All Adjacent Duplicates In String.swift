class Solution {
    func removeDuplicates(_ s: String) -> String {
        var stack = [Character]()
        var chars = Array(s)

        for ch in chars {
            if stack.isEmpty || stack.last != ch {
                stack.append(ch)
            } else {
                stack.removeLast()
            }
        }

        return String(stack)
    }
}
