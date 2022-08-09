class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var mapS = [Character:Int]()
        var mapT = [Character:Int]()
        
        for ch in Array(s) {
            mapS[ch, default: 0] += 1
        }
        
        for ch in Array(t) {
            mapT[ch, default: 0] += 1
        }
        
        for k in mapT.keys {
            if mapS[k] == nil || mapS[k]! < mapT[k]! {
                return k
            }
        }
        
        return Character("")
    }
}
