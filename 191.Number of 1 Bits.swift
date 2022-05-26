class Solution {
    func hammingWeight(_ n: Int) -> Int {
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
