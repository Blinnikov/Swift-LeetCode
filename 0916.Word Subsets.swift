class Solution {
    private var cache = [String:Bool]()
    private var mapOfMaps = [String:[Character:Int]]()
    
    func wordSubsets(_ words1: [String], _ words2: [String]) -> [String] {
        var result = [String]()
        
        let unique = Array(Set(words2))
        let uniqueMap = universalMap(unique)

        for w in words1 {
            // if isUniversal(w, unique) {
            if isUniversal(w, uniqueMap) {
                result.append(w)
            }
        }
        
        return result
    }
    
    private func universalMap(_ words: [String]) -> [Character:Int] {
        var result = [Character:Int]()
        
        for word in words {
            let m = stringToMap(word)
            for k in m.keys {
                if let exist = result[k] {
                    result[k] = max(exist, m[k]!)
                } else {
                    result[k] = m[k]
                }
            }
        }
        
        return result
    }
    
    private func isUniversal(_ word1: String, _ words2: [String]) -> Bool {
        words2.allSatisfy({ isSubset(word1, $0) })
    }
    
    private func isUniversal(_ word1: String, _ unique: [Character:Int]) -> Bool {
        var map = stringToMap(word1)
        
        for k in unique.keys {
            if map[k] == nil || map[k]! < unique[k]! {
                return false
            }
        }
        
        return true
    }
    
    private func isSubset(_ w1: String, _ w2: String) -> Bool {
        let cacheKey = "\(w1),\(w2)"
        if let res = cache[cacheKey] {
            return res
        }
        
        var map1 = stringToMap(w1)
        
        var map2 = stringToMap(w2)
        
        for k in map2.keys {
            if map1[k] == nil || map1[k]! < map2[k]! {
                cache[cacheKey] = false
                return false
            }
        }
        
        cache[cacheKey] = true
        return true
    }
    
    private func stringToMap(_ word: String) -> [Character:Int] {
        if let exist = mapOfMaps[word] {
            return exist
        }
        
        var map = [Character:Int]()
        for ch in word {
            map[ch, default: 0] += 1
        }
        
        mapOfMaps[word] = map
        
        return map
    }
}
