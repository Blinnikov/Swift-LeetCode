class Solution {
    private let a = Character("a").asciiValue!
    
    func breakPalindrome(_ palindrome: String) -> String {
        var chars = Array(palindrome)
        
        for i in 0..<chars.count {
            if chars[i].asciiValue! > a {
                let orig = chars[i]
                chars[i] = "a"
                if !isPalindrome(chars) {
                    return String(chars)
                } else {
                    chars[i] = orig
                }
            } 
        }
        
        for i in stride(from: chars.count-1, through: 0, by: -1) {
            if chars.count > 1 && i > 0 {
                chars[i] = "b"
                return String(chars)
            }
        }
        
        return ""
    }
    
    private func isPalindrome(_ chars: [Character]) -> Bool {
        var lo = 0, hi = chars.count-1
        while lo < hi {
            if chars[lo] != chars[hi] {
                return false
            }
            lo += 1
            hi -= 1
        }
        return true
    }
}
