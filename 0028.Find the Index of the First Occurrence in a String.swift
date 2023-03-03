class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.isEmpty {
            return 0
        }
        
        var h = Array(haystack)
        var n = Array(needle)
        
        var result = -1
        var candidates = [Int]()
        
        for i in 0..<h.count {
            if n[0] == h[i] {
                candidates.append(i)
            }
        }
        
        loopCandidates: for candidate in candidates {
            if candidate + n.count > h.count {
                continue
            }
            
            for i in 0..<n.count {
                if n[i] != h[candidate+i] {
                    continue loopCandidates
                }
            }
            
            return candidate
        }
        
        return result
    }
}
