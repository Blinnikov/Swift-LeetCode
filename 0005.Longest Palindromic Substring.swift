class Solution {
    func longestPalindrome(_ s: String) -> String {
        let chars = Array(s)
        let n = chars.count
        var dp = Array(repeating: Array(repeating: -1, count: n), count: n)
        
        var maxLen = 0, s = 0, e = 0
        for row in stride(from: n-1, through: 0, by: -1) {
            for col in stride(from: row, through: n-1, by: 1) {
                if isPalindrome(&dp, chars, from: row, to: col) {
                    if col-row > maxLen {
                        maxLen = col-row
                        s = row
                        e = col
                    }
                }
            }
        }
        
        var result = [Character]()
        for i in s...e {
            result.append(chars[i])
        }
        
        let str = String(result)
        
        return str
    }
    
    private func isPalindrome(_ dp: inout [[Int]], _ chars: [Character], from row: Int, to col: Int) -> Bool {
        if row == col {
            dp[row][col] = 1
            return true
        }
        
        if row+1 > col-1 { // below diagonal
            // two chars substring
            if chars[col] == chars[row] {
                // first char of the string equals to its last char
                dp[row][col] = 1
                return true
            } 
        }
        
        if dp[row+1][col-1] == 1 {
            // previous palindrome exists
            if chars[col] == chars[row] {
                // first char of the string equals to its last char
                dp[row][col] = 1
                return true
            } 
        } 
        
        return false
    }
}
