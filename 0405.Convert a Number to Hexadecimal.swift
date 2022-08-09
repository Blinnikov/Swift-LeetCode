class Solution {
    private let digits = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]
    
    func toHex(_ num: Int) -> String {
        if num == 0 {
            return "0"
        }
        
        // var num = num > 0 ? num : Int(pow(2.0, 32.0)) + num
        var num = num > 0 ? num : Int(UInt32.max) + 1 + num
        
        var res = ""
        while num > 0 {
            let digit = digits[num % 16]
            res = digit + res
            num >>= 4
        }
        
        return res
    }
}
