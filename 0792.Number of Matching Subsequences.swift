// TLE

class Solution {
    func numMatchingSubseq(_ s: String, _ words: [String]) -> Int {
        var result = 0;
        var map = [String:Int]()
        
        for word in words {
            if map[word] != nil {
                map[word] = map[word]! + 1
            } else {
                map[word] = 1
            }
        }
        
        for word in map.keys {
            if isSubsequence(s, word) {
                result += map[word]!
            }
        }
        
        return result;
    }
    
    private func isSubsequence(_ s: String, _ t: String) -> Bool {
        if t.count > s.count {
            return false
        }
        
        let charsS = Array(s)
        let charsT = Array(t)
        
        var pointerS = 0
        var pointerT = 0
        
         while pointerS < charsS.count && pointerT < charsT.count {
                if charsS[pointerS] == charsT[pointerT] {
                    pointerS += 1
                    pointerT += 1
                } else {
                    pointerS += 1
                }
            }
        
        return pointerT == charsT.count
    }
}
