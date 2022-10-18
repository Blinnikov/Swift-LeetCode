class Solution {
    func countAndSay(_ n: Int) -> String {
        if n == 1 {
            return "1"
        }
        
        return convert(countAndSay(n - 1))
    }
    
    private func convert(_ s: String) -> String {
        let chars = Array(s)
        if chars.count == 1 {
            return String("1\(chars[0])")
        }
        
        var res = ""
        var curr = chars[0]
        var count = 1
        
        for i in 1..<chars.count {
            if chars[i] == curr {
                count += 1
            } else {
                res += "\(count)\(curr)"
                curr = chars[i]
                count = 1
            }
        }
        
        res += "\(count)\(curr)"
        
        return res
    }
}
