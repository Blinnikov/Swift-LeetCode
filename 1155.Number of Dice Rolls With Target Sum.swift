class Solution {
    private let _mod_ = 1000000007
    var dp = [[Int]]()
    
    func numRollsToTarget(_ n: Int, _ k: Int, _ target: Int) -> Int {
        dp = Array(repeating: Array(repeating: -1, count: target+1), count: n+1)
        return recurse(n, k, target)
    }
    
    private func recurse(_ n: Int, _ k: Int, _ target: Int) -> Int {
        if n == 0 && target == 0 {
            return 1
        }
        
        if n == 0 || target < 0 {
            return 0
        }
        
        if dp[n][target] != -1 {
            return dp[n][target]
        }
        
        var solutions = 0
        for i in 1...k {
            if i > target {
                break
            }
            solutions += recurse(n-1, k, target-i)
        }
        
        dp[n][target] = solutions % _mod_
        return dp[n][target]
    }
}
