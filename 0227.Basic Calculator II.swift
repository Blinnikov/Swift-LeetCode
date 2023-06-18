class Solution {
    
    private let zeroAsciiValue = 48
    
    func calculate(_ s: String) -> Int {
        let chars = Array(s)
        var stack = [Int]()
        var current = 0
        var operation: Character = "+"
        
        for i in 0..<chars.count {
            let ch = chars[i]
            if ch.isNumber {
                current = (current * 10) + (Int(ch.asciiValue!) - zeroAsciiValue)
            }
            if !ch.isNumber && ch != " " || i == chars.count-1 {
                if operation == "-" {
                    stack.append(-current)
                } else if operation == "+" {
                    stack.append(current)
                } else if operation == "*" {
                    stack.append(stack.removeLast() * current)
                } else if operation == "/" {
                    stack.append(stack.removeLast() / current)
                }
                operation = ch
                current = 0
            }
        }
        
        var res = 0
        while !stack.isEmpty {
            res += stack.removeLast()
        }
        
        return res
    }
}
