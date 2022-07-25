class Solution {
    private let aValue = 97
    
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        let s = s.map(intValue)
        let p = p.map(intValue)
        let len = p.count
        
        var ref = Array(repeating: 0, count: 26)
        var work = Array(repeating: 0, count: 26)
        for char in p {
            ref[char] += 1
        }
        
        var result = [Int]()

        for i in 0..<s.count {
            work[s[i]] += 1
            if i - p.count >= 0 {
                work[s[i-len]] -= 1
            }

            if work == ref {
                result.append(i - len + 1)
            }
        }
        
        return result
    }
    
    private func intValue(_ ch: Character) -> Int {
        return Int(ch.asciiValue!) - aValue
    }
}
