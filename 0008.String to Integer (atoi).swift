class Solution {
    private let minResult = -pow(2, 31)
    private let maxResult = pow(2, 31) - 1
    
    func myAtoi(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }
        
        let chars = Array(s)
        var sign = false
        var idx = 0
        
        while idx < chars.count && chars[idx] == " " {
            idx += 1
        }
        
        if idx < chars.count && (chars[idx] == "-" || chars[idx] == "+") {
            sign = chars[idx] == "-"
            idx += 1
        }
        
        var r = 0
        while idx < chars.count && chars[idx].isASCII && chars[idx].isNumber {
            r = r*10 + Int(chars[idx].description)!
            idx += 1
            
            if Int32(r.description) == nil {
                return sign ? Int(Int32.min) : Int(Int32.max)
            }
        }
        
        if sign {
            r = -r
        }
        
        return r
    }
}
