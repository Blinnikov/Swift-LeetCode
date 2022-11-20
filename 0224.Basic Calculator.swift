class Solution {
    func calculate(_ s: String) -> Int {
        let chars = Array(s)
        var stack = [Int]()

        var number = 0;
        var result = 0;
        var sign = 1;

        for ch in chars {
            if ch.isNumber {
                number = 10 * number + ch.wholeNumberValue!
                // print(number)
            } else if ch == "+" {
                result += (sign * number)
                number = 0
                sign = 1
            } else if ch == "-" {
                result += (sign * number)
                number = 0
                sign = -1
            } else if ch == "(" {
                stack.append(result)
                stack.append(sign)
                
                sign = 1
                result = 0
            } else if ch == ")" {
                result += (sign * number)
                number = 0
                
                result *= stack.removeLast()
                result += stack.removeLast()
            }
        }

        if number != 0 {
            result += (sign * number)
        }
        
        return result
    }
}
