class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let arr = Array(s)
        // var map = [Character:Int]()
        var map = Array(repeating: 0, count: 256)
        var lo = 0, hi = 0
        
        var result = 0
        
        while hi < s.count {
            // print("Start looping, lo=\(lo), hi=\(hi)")
            
            // if let exist = map[arr[hi]] {
            //     lo = max(lo, exist+1)
            // }
            
            let n = Int(arr[hi].asciiValue!)
            lo = map[n] > 0 ? max(lo, map[n]) : lo
            
            map[n] = hi+1
            
            // while hi < s.count && map[arr[hi]] == nil {
            //     map[arr[hi]] = true
            //     hi += 1
            // }
            
            // if hi-lo > result {
            //     result = hi-lo
            //     hi += 1
            // }
            
            result = max(hi-lo+1, result)
            
            hi += 1
            // print("lo=\(lo), hi=\(hi), result=\(result)")
            // print(map)
            // map[arr[lo]] = nil
            // print(map)
            // // map.removeAll()
            // print("\n\n")
            // lo += 1
        }
        
        return result
    }
}
