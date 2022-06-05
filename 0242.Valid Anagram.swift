class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var map = [Character:Int]()
        
        for ch in Array(s) {
            if let exist = map[ch] {
                map[ch] = exist + 1
            } else {
                map[ch] = 1
            }
        }
        
        for ch in Array(t) {
            if let exist = map[ch] {
                map[ch] = exist - 1
                if map[ch] == 0 {
                    map[ch] = nil
                }
            } else {
                return false
            }
        }
        
        return map.count == 0
    }
}
