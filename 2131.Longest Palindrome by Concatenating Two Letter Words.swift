class Solution {
    func longestPalindrome(_ words: [String]) -> Int {
        var map = [String:Int]()
        var sameCharsMap = [String:Int]()
        
        for word in words {
            let chars = Array(word)
            if chars[0] == chars[1] {
                sameCharsMap[word, default: 0] += 1
            } else {
                map[word, default: 0] += 1
            }
        }
        
        let sortedMap = Array(sameCharsMap).sorted { $0.value > $1.value }
        
        var count = 0
        var oddCountUsed = false
        for p in sortedMap {
            if p.value % 2 == 0 {
                count += p.value * 2
            } else {
                if !oddCountUsed {
                    oddCountUsed = true
                    count += p.value * 2
                } else {
                    count += (p.value - 1) * 2
                }
            }
        }
        
        
        var checked = Set<String>()
        for word in map.keys {
            if checked.contains(word) {
                continue
            }
            
            let chars = Array(word)
            
            let reverse = "\(chars[1])\(chars[0])"
            if map[reverse] != nil && !checked.contains(reverse) {
                checked.insert(word)
                checked.insert(reverse)
                
                let pairs = min(map[word]!, map[reverse]!)
                count += (4 * pairs)
            }
        }
        
        return count
    }
}
