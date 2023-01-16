class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        
        guard s.count > 0, t.count > 0 else {
            return ""
        }
        
        var charsS = Array(s)
        
        var mapT = [Character:Int]()
        for ch in t {
            mapT[ch, default: 0] += 1
        }
        
        var found = 0
        var left = 0, right = 0
        var result: (count: Int, left: Int, right: Int) = (-1, left, right)
        
        var mapWindow = [Character:Int]()
        
        while right < charsS.count {
            let ch = charsS[right]
            mapWindow[ch, default: 0] += 1
            
            if let chCount = mapT[ch], mapWindow[ch] == chCount {
                found += 1
            }
            
            while left <= right, found == mapT.count {
                let ch = charsS[left]
                
                if result.count == -1 || right - left + 1 < result.count {
                    result.count = right - left + 1
                    result.left = left
                    result.right = right
                }
                
                mapWindow[ch]! -= 1
                if mapT[ch] != nil && mapWindow[ch]! < mapT[ch]! {
                    found -= 1
                }
                
                left += 1
            }
            
            right += 1
        }
        
        return result.count == -1 ? "" : String(charsS[result.left...result.right])
        
    }
}
