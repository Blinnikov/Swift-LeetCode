class Solution {
    private var result = [[String]]()
    
    func partition(_ s: String) -> [[String]] {
        var sub = [String]()
        dfs(0, &sub, Array(s))
        return result
    }
    
    private func dfs(_ s: Int, _ sub: inout [String], _ word: [Character]) {
        if s >= word.count {
            result.append(sub)
        }
        
        for e in s..<word.count {
            if isPalindrome(word, s, e) {
                sub.append(String(word[s...e]))
                dfs(e+1, &sub, word)
                sub.removeLast()
            }
        }
    }
    
    private func isPalindrome(_ word: [Character], _ lo: Int, _ hi: Int) -> Bool {
        var lo = lo, hi = hi
        while lo < hi {
            if word[lo] != word[hi] {
                return false
            }
            lo += 1
            hi -= 1
        }
        
        return true
    }
}
