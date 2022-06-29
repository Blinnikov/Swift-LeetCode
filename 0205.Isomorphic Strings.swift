class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var arrayS = Array(s)
        var mapS = Array(repeating: -1, count: 256)
        var arrayT = Array(t)
        var mapT = Array(repeating: -1, count: 256)
        
        for i in 0..<arrayS.count {
            let valS = Int(arrayS[i].asciiValue!)
            let valT = Int(arrayT[i].asciiValue!)
            
            if mapS[valS] == -1 && mapT[valT] == -1 {
                mapS[valS] = valT
                mapT[valT] = valS
            } else if !(mapS[valS] == valT && mapT[valT] == valS) {
                return false
            }
        }
        
        return true
    }
}
