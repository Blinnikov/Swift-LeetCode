class Solution {
    func reverseWords(_ s: String) -> String {
        s.split(separator: " ").map { String($0.reversed()) }.joined(separator: " ")
        
    }
    
    private func reverseWords_v1(_ s: String) -> String {
        var stack = [Character]()
        var result = ""
        
        for ch in s {
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
