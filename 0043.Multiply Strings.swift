class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" {
            return "0"
        }
        
        if num1 == "1" {
            return num2
        }
        
        if num2 == "1" {
            return num1
        }
        
        var result = ""
        let chars = Array(num2)
        
        for i in stride(from: chars.count-1, through: 0, by: -1) {
            var mult = multiply(num1, chars[i])
            if result == "" {
                result = mult
            } else {
                mult = mult + String(Array(repeating: Character("0"), count: chars.count-1-i))
                result = sum(result, mult)
            }
        }
        
        return result
    }
    
    private func multiply(_ num: String, _ ch: Character) -> String {
        let digit = Int(String(ch))!
        var chars = Array(num)
        
        var result = ""
        var overflow = 0
        
        for i in stride(from: chars.count - 1, through: 0, by: -1) {
            let mult = Int(String(chars[i]))! * digit + overflow
            if mult > 9 {
                let rem = mult % 10
                result = "\(rem)\(result)"
                overflow = mult / 10
            } else {
                result = "\(mult)\(result)"
                overflow = 0
            }
        }
        
        if overflow > 0 {
            result = "\(overflow)\(result)"
        }
        
        return result
    }
    
    private func sum(_ num1: String, _ num2: String) -> String {
        var num1 = num1, num2 = num2
        let c1 = num1.count, c2 = num2.count, mx = max(c1,c2), mn = min(c1,c2)
        let zeros: [Character] = Array(repeating: "0", count: mx - mn)
        if c1 < c2 {
            num1 = String(zeros) + num1
        } else if c2 < c1 {
            num2 = String(zeros) + num2
        }
        
        // print(num1, num2)
        
        var chars1 = Array(num1), chars2 = Array(num2)
        var result = ""
        var overflow = 0
        
        for i in stride(from: mx-1, through: 0, by: -1) {
            let sum = Int(String(chars1[i]))! + Int(String(chars2[i]))! + overflow
            if sum > 9 {
                let rem = sum % 10
                result = "\(rem)\(result)"
                overflow = sum / 10
            } else {
                result = "\(sum)\(result)"
                overflow = 0
            }
        }
        
        if overflow > 0 {
            result = "\(overflow)\(result)"
        }
        
        // print(result)
        
        return result
    }
}
