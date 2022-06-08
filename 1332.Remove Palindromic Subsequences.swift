class Solution {
    func removePalindromeSub(_ s: String) -> Int {
        isPalindrome(s) ? 1 : 2
    }
    
    private func isPalindrome(_ s: String) -> Bool {
        var chars = Array(s)
        for i in 0..<chars.count/2 {
            if chars[i] != chars[chars.count-1-i] {
                return false
            }
        }
        return true
    }
}
