class Solution {
    func compress(_ chars: inout [Character]) -> Int {
        if chars.count == 1 {
            return 1
        }
        
        var str = ""
        var i = 0
        while i < chars.count-1 {
            var count = 1
            while i < chars.count-1 && chars[i] == chars[i+1] {
                i += 1
                count += 1
            }
            
            if count == 1 {
                str += "\(chars[i])"
            } else {
                str += "\(chars[i])\(count)"
            }
            
            i += 1
        }
        
        if i == chars.count-1 {
            str += "\(chars[i])"
        }
        
        chars = Array(str)
        
        return str.count
    }
}
