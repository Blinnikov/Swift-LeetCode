class Solution {
    
    func generateParenthesis(_ n: Int) -> [String] {
        return recurse(n)
    }
    
    private func recurse(_ n: Int) -> [String] {
        var res = [String]()
        if n == 0 {
            res.append("")
        } else {
            for i in 0..<n {
                for left in recurse(i) {
                    for right in recurse(n-1-i) {
                        res.append("(\(left))\(right)")
                    }
                }
            }
        }
        
        return res
    }
    
    private func generateParenthesis_v1(_ n: Int) -> [String] {
        var dp = Array(repeating: Set<String>(), count: n)
        dp[0] = ["()"]
        
        if n == 1 {
            return ["()"]
        }
        
        for i in 1..<n {
            for el in dp[i-1] {
                dp[i].insert("(\(el))")
                dp[i].insert("\(el)()")
                dp[i].insert("()\(el)")
            }
        }
        
        return Array(dp[n-1])
    }
}
