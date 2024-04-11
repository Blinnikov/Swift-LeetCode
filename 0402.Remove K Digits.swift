class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        if num.count == k {
            return "0"
        }

        var k = k
        var chars = Array(num)
        var stack = [Character]()

        for ch in chars {
            while !stack.isEmpty, stack.last! > ch, k > 0 {
                stack.removeLast()
                k -= 1
            }

            stack.append(ch)
        }

        while !stack.isEmpty, k > 0 {
            stack.removeLast()
            k -= 1
        }

        while !stack.isEmpty, stack.first! == "0" {
            stack.removeFirst()
        }

        if stack.isEmpty {
            return "0"
        }

        return String(stack)
    }
}
