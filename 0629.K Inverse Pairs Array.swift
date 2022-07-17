class Solution {
    private var memo = Array(repeating: Array(repeating: -1, count: 1001), count: 1001) 
    
    func kInversePairs(_ n: Int, _ k: Int) -> Int {
        if n == 0 {
            return 0
        }
        
        if k == 0 {
            return 1
        }
        
        if memo[n][k] != -1 {
            return memo[n][k]
        }
        
        var inverse = 0
        for i in 0...min(k, n-1) {
            inverse = (inverse + kInversePairs(n-1, k-i)) % 1000000007
        }
        memo[n][k] = inverse
        
        return inverse
    }
}
