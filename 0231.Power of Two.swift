class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        (n > 0) && ((n & (n-1)) == 0)
        // isPowerOfTwoCycle(n)
    }
    
    private func isPowerOfTwoCycle(_ n: Int) -> Bool {
        if n == 0 {
            return false
        }
        
        if n == 1 {
            return true
        }
        
        var n = n
        while n > 0 && n % 2 == 0 {
            n = n >> 1
        }
        
        return n == 1 || n == 0
    }
}
