class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var res = 0
        var stack = [Int]()
        stack.append(-1)
        
        for (i, ch) in s.enumerated() {
            if ch == "(" {
                stack.append(i)
            } else {
                stack.removeLast()
                if stack.isEmpty {
                    stack.append(i)
                } else {
                    let length = i - stack[stack.count-1]
                    if length > res {
                        res = length
                    }
                }
            }
        }
        
        return res
    }
    
    private func dpAttempt(_ s: String) -> Int {
        if s == "" {
            return 0
        }
        
        let count = s.count
        var chars = Array(s)
        var dp = Array(repeating: Array(repeating: 0, count: count+1), count: count+1)
        var res = 0
        
        // printMatrix(dp)
        
        for i in stride(from: count, through: 1, by: -1) { //  1...count
            for j in stride(from: count, through: i, by: -1) { // i...count
                dp[i][j] = dp[i][j-1]
                if isValid(chars, i-1, j-1, dp) {
                    // print("valid for (\(i-1), \(j-1))")
                    dp[i][j] = j-i+1
                } else {
                    dp[i][j] = -1
                }
                
                if dp[i][j] > res {
                    res = dp[i][j]
                }
            }
        }
        
        printMatrix(dp)
        
        // var chars = Array(")()())")
        // print(isValid(chars, 1, chars.count-2))
        return res
    }
    
    private func isValid(_ chars: [Character], _ s: Int, _ e: Int, _ dp: [[Int]]) -> Bool {
        // print("Checking is valid for (\(s), \(e))")
        if (e-s) % 2 == 0 {
            return false
        }
        
        if e-s == 1 {
            return chars[s] == "(" && chars[e] == ")"
        }
        
        if chars[s] == ")" || chars[e] == "(" {
            return false
        }
        
        // (****)
        if chars[s] == "(" && chars[e] == ")" && dp[s+1 + 1][e-1 + 1] > 0 {
            // print("Checking (****)")
            // print("dp[s+1][e-1]=\(dp[s+1 + 1][e-1 + 1])")
            return true
        }
        
        //  (**)(**)
        // return (dp[s][s + (e-s)/2] && dp[s + (e-s)/2 + 1][e]) // this is wrong - we cannot separate evenly
        
        // using stack
        // print("Fallback to stack check for (\(s),\(e))")
        
        var stack = [Character]()
        stack.reserveCapacity(chars.count)
        
        for i in s...e {
            if chars[i] == ")" {
                if stack.isEmpty {
                    return false
                }
                
                if stack.removeLast() != "(" {
                    return false
                }
            }
            
            if chars[i] == "(" {
                stack.append("(")
            }
        }
        
        return stack.isEmpty
    }
    
    private func printMatrix(_ m: [[Int]]) {
        var res = ""
        
        for row in m {
            var rowStr = "["
            for col in row {
                rowStr += " \(col),"
            }
            rowStr = "\(String(rowStr.dropLast())) ]\n"
            res += rowStr
        }
        
        print(res)
    }
}
