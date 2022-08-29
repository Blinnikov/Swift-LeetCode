class Solution {
    func frequencySort(_ s: String) -> String {
        var chars = Array(s)
        var map = [Character:Int]()
        for ch in chars {
            map[ch, default: 0] += 1
        }
        
        let sorted = map.sorted { $0.1 > $1.1 }
        var res = [Character]()
        
        for pair in sorted {
            res += Array(repeating: pair.0, count: pair.1)
        }
        
        return String(res)
    }
}
