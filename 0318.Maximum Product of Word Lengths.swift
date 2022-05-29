class Solution {
    func maxProduct(_ words: [String]) -> Int {
        var res = 0
        
        for i in 0..<words.count {
            for j in i..<words.count {
                if !haveCommonChars(words[i], words[j]) {
                    res = max(res, words[i].count * words[j].count)
                }
            }
        }
        
        return res
    }
    
    private func haveCommonChars(_ str1: String, _ str2: String) -> Bool {
        let bits1 = str1.reduce(0, { $0 | charToInt($1) })
        for ch in str2 {
            if bits1 & charToInt(ch) != 0 {
                return true
            }
        }
        return false
    }

    private func charToInt(_ ch: Character) -> Int {
        1 << (ch.asciiValue! - Character("a").asciiValue!)
    }
}
