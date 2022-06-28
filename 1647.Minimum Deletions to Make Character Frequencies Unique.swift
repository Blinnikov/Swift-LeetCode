class Solution {
    func minDeletions(_ s: String) -> Int {
        var map = [Character:Int]()
        for ch in Array(s) {
            if let exist = map[ch] {
                map[ch] = exist + 1
            } else {
                map[ch] = 1
            }
        }
        
        var sorted = map.sorted { $0.1 > $1.1 }
        
        var attempts = 0
        for i in 1..<sorted.count {
            while(sorted[i].value >= sorted[i-1].value && sorted[i].value > 0) {
                attempts += 1
                sorted[i].value -= 1
            }
        }
        
        return attempts
    }
}
