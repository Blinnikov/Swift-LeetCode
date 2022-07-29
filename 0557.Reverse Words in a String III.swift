class Solution {
    func reverseWords(_ s: String) -> String {
        var arr = Array(s)
        var stack = [Character]()
        var result = ""
        
        for ch in arr {
            if ch == " " {
                result += "\(String(stack.reversed())) "
                stack = []
            } else {
                stack.append(ch)
            }
        }
        
        if !stack.isEmpty {
            result += String(stack.reversed())
        }
        
        return result
    }
}
