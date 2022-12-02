class Solution {
    func closeStrings(_ word1: String, _ word2: String) -> Bool {
        if word1.count != word2.count {
            return false
        }

        var map1 = [Character:Int]()
        var map2 = [Character:Int]()

        let chars1 = Array(word1)
        let chars2 = Array(word2)

        for ch in chars1 {
            map1[ch] = map1[ch, default: 0] + 1
        }

        for ch in chars2 {
            map2[ch] = map2[ch, default: 0] + 1
        }

        if map1.keys.count != map2.keys.count {
            return false
        }

        for k in map1.keys {
            if map2[k] == nil {
                return false
            }
        }
        
        let val1 = map1.values.sorted()
        let val2 = map2.values.sorted()

        return val1 == val2
    }
}
