class Solution {
    func isPowerOfFour(_ n: Int) -> Bool {
        n > 0 && (n & (n - 1)) == 0 && (n - 1) % 3 == 0
    }
    
    func isPowerOfFourCycle(_ n: Int) -> Bool {
        if n == 0 {
            return false
        }
        
        if n == 1 {
            return true
        }
        
        var n = n
        while n > 0 && n % 4 == 0 {
            n = n >> 2
        }
        
        return n == 1 || n == 0
    }
}
