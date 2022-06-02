class Solution {
    func firstUniqChar(_ s: String) -> Int {
        if s.count == 1 {
            return 0
        }
        
        var map = [Character:Int]()
        
        for ch in s {
            map[ch] = (map[ch] ?? 0) + 1
        }
        
        for (i, ch) in s.enumerated() {
            if map[ch]! == 1 {
                return i
            }
        }
        
        return -1
    }
}
