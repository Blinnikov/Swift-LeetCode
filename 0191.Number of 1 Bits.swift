class Solution {
    func hammingWeight(_ n: Int) -> Int {
        n.nonzeroBitCount
    }
    
    private func hammingWeight_v2(_ n: Int) -> Int {
        var result = 0
        var n = n
        for _ in 0..<32 {
            result += n & 1
            n >>= 1
        }
        return result
    }
    
    private func hammingWeight_v1(_ n: Int) -> Int {
        var n = n
        var count = 0
        while n > 0 {
            if n % 2 != 0 {
                count += 1
            }
            
            n = n / 2
        }
        
        return count 
        // Array(String(n, radix: 2)).reduce(0, { $0 + $1.wholeNumberValue! })
    }
}
