class Solution {
    func numDecodings(_ s: String) -> Int {
        let chars = Array(s)
        let firstValid = isValid([chars[0]]) ? 1 : 0
        if chars.count == 1 {
            return firstValid
        }
        
        var dp = Array(repeating: 0, count: chars.count + 1)
        dp[0] = 1
        dp[1] = firstValid
        
        for i in 2..<dp.count {
            if isValid([chars[i-1]]) {
                dp[i] += dp[i-1]
            }
            if isValid([chars[i-2],chars[i-1]]) {
                dp[i] += dp[i-2]
            }
        }
        
        return dp[dp.count-1]
    }
    
    private func isValid(_ num: [Character]) -> Bool {
        if num.count < 0 || num.count > 2 {
            return false
        }
        
        if num[0] == "0" {
            return false
        }
        
        if let n = Int(String(num)), n >= 1, n <= 26 {
            return true
        }
        
        return false
    }
}
