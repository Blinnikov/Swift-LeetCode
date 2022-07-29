class Solution {
    func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
        words.filter { match(Array($0), Array(pattern)) }
    }
    
    private func match(_ word: [Character], _ pattern: [Character]) -> Bool {
        // print("checking \(String(word))")
        if word.count != pattern.count {
            return false
        }
        
        var mapW = [Character:Character]()
        var mapP = [Character:Character]()
        
        for i in 0..<word.count {
            let w = word[i]
            let p = pattern[i]
            if mapW[w] == nil {
                mapW[w] = p
            }
            if mapP[p] == nil {
                mapP[p] = w
            }
            
            if let chW = mapW[w], let chP = mapP[pattern[i]], chW != p || chP != w {
                return false
            }
        }
        
        return true
    }
}
