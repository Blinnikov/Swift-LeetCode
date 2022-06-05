class Solution {
    func titleToNumber(_ columnTitle: String) -> Int {
        let chars = Array(columnTitle)
        let count = chars.count
        
        var result = 0
        for i in 0..<count {
            result += (Int(chars[i].asciiValue!) - 64) * Int(NSDecimalNumber(decimal: pow (26, count - 1 - i)))
        }
        
        return result
    }
}
