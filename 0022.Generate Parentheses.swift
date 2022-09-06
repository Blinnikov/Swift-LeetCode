class Solution {
    private var answer = [String]()
    
    func generateParenthesis(_ n: Int) -> [String] {
        recurse_v2("", 0, 0, n)
        return answer
        // return recurse(n)
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
    
    private func recurse_v2(_ current: String, _ open: Int, _ closed: Int, _ n: Int) {
        if current.count == n*2 {
            answer.append(current)
            return
        }
        
        if open < n {
            recurse_v2(current + "(", open+1, closed, n)
        }
        
        if closed < open {
            recurse_v2(current + ")", open, closed+1, n)
        }
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
