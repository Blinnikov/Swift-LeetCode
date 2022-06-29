class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        if s.count > t.count {
            return false
        }
        let charsS = Array(s)
        let charsT = Array(t)
        
        var pointerS = 0
        var pointerT = 0
        
        while pointerS < charsS.count {
            if pointerT >= charsT.count {
                return false
            }
            
            while charsT[pointerT] != charsS[pointerS] {
                if pointerT == charsT.count - 1 {
                    return false
                }
                pointerT += 1
            }
            pointerS += 1
            pointerT += 1
        }
        
        return true
    }
}
