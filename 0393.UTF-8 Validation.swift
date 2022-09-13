class Solution {
    func validUtf8(_ data: [Int]) -> Bool {
        var bytes = 0
        let mostSignificantBit = 1 << 7
        let secondSignificantBit = 1 << 6
        
        for i in 0..<data.count {
            
            if bytes == 0 {
                var mask = 1 << 7
                while mask & data[i] != 0 {
                    bytes += 1
                    mask >>= 1
                }
                
                if bytes == 0 {
                    continue
                }
                
                if bytes > 4 || bytes == 1 {
                    return false
                }
                
            } else {
                if !((data[i] & mostSignificantBit) != 0 && (data[i] & secondSignificantBit == 0)) {
                    return false
                }
            }
            
            bytes -= 1
        }
        
        return bytes == 0
    }
}
