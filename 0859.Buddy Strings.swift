class Solution {
    func buddyStrings(_ s: String, _ goal: String) -> Bool {
        if s.count != goal.count {
            return false
        }
        
        if s == goal {
            var mapS = [Character:Int]()
        
            for ch in Array(s) {
                mapS[ch, default: 0] += 1
            }
            
            for pair in mapS {
                if pair.value > 1 {
                    return true
                }
            }
        } else {
            var firstIdx = -1, secondIdx = -1
            let sAr = Array(s), gAr = Array(goal)
            
            for i in 0..<s.count {
                if sAr[i] != gAr[i] {
                    if firstIdx == -1 {
                        firstIdx = i
                    } else if secondIdx == -1 {
                        secondIdx = i
                    } else {
                        return false
                    }
                }
            }
            
            return secondIdx != -1 && sAr[firstIdx] == gAr[secondIdx] && sAr[secondIdx] == gAr[firstIdx]
        }
        
        return false
    }
}
