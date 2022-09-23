class Solution {
    
    private let mod = 1000000007
    
    func concatenatedBinary(_ n: Int) -> Int {
        var sum = 0, length = 0
        
        for i in 1...n {
            if i & (i-1) == 0 {
                length += 1
            }
            
            sum = ((sum << length) | i) % mod
        }
        
        return sum
    }
}
