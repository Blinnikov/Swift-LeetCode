class Solution {
    func reverseBits(_ n: Int) -> Int {
        var n = n
        
        var result = 0
        // var str = ""
        for i in 0..<32 {
            result = (result << 1) + (1 & n)
            // str += n & 1 == 1 ? "1" : "0"
            n = n >> 1
        }
        
        return result
        
        // return Int(str, radix: 2)!
    }
}
