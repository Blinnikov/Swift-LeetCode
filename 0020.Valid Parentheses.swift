class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        
        for ch in s {
            if isClosingBracket(ch) {
                if stack.count == 0 || stack.removeLast() != reverse(ch) {
                    return false
                }
            } else {
                stack.append(ch)
            }
        }
        
        return stack.isEmpty
    }
    
    private func isClosingBracket(_ ch: Character) -> Bool {
        ch == ")" || ch == "}" || ch == "]"
    }
    
    private func reverse(_ ch: Character) -> Character {
        switch ch {
            case ")": return "("
            case "}": return "{"
            case "]": return "["
            default: return "0"
        }
    }
}
