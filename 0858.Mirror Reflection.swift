class Solution {
    func mirrorReflection(_ p: Int, _ q: Int) -> Int {
        var p = p, q = q
        
        while p % 2 == 0 && q % 2 == 0 {
            p /= 2
            q /= 2
        }
        
        if p % 2 != 0 && q % 2 != 0 {
            return 1
        }
        if p % 2 == 0 && q % 2 != 0 {
            return 2
        }
        if p % 2 != 0 && q % 2 == 0 {
            return 0
        }
        
        return -1
    }
}
