class Solution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var x = x, y = y, result = 0
        
        for _ in 0..<32 {
            result += (x & 1) ^ (y & 1)
            x = x >> 1
            y = y >> 1
        }
        
        return result
    }
}
