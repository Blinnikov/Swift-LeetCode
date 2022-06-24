class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let arr = Array(s)
        var map = Array(repeating: 0, count: 256)
        var lo = 0, hi = 0
        
        var result = 0
        
        for hi in 0..<s.count {
            let n = Int(arr[hi].asciiValue!)
            lo = map[n] > 0 ? max(lo, map[n]) : lo
            
            map[n] = hi+1
            
            result = max(hi-lo+1, result)
        }
        
        return result
    }
}
