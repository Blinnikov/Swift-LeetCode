class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        for t in tokens {
            if t == "+" {
                let a = stack.removeLast()
                let b = stack.removeLast()
                stack.append(a + b)
            } else if t == "-" {
                let a = stack.removeLast()
                let b = stack.removeLast()
                stack.append(b - a)
            } else if t == "*" {
                let a = stack.removeLast()
                let b = stack.removeLast()
                stack.append(a * b)
            } else if t == "/" {
                let a = stack.removeLast()
                let b = stack.removeLast()
                stack.append(b / a)
            } else {
                stack.append(Int(t)!)
            }
        }

        return stack.last!
    }
}
