class Solution {
    private let A = 65
    
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        let s = s.map(intValue)
        var count = Array(repeating: 0, count: 26)
        
        var start = 0, end = 0, maxCount = 0, res = 0
        
        while end < s.count {
            count[s[end]] += 1
            maxCount = max(maxCount, count[s[end]])
            
            let windowSize = end - start + 1
            let differentChars = windowSize - maxCount
            
            if differentChars > k {
                count[s[start]] -= 1
                start += 1
            }
            
            res = max(maxCount, end - start + 1)
            end += 1
        }
        
        return res
    }
    
    func intValue(_ ch: Character) -> Int {
        return Int(ch.asciiValue!) - A
    }
}
