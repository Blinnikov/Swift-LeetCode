class Solution {
    func minimumLengthEncoding(_ words: [String]) -> Int {
        var set = Set(words)
        
        for word in words {
            for i in 1..<word.count { // for each substring == for each possible suffix
                let idx = word.index(word.startIndex, offsetBy: i)
                let suffix = String(word[idx...])
                set.remove(suffix) // remove duplicates
            }
        }
        
        return set.reduce(0, { $0 + $1.count+1 }) // sum of all left strings +1 (for hashbang)
    }
}
