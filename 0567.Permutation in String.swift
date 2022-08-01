class Solution {
    private var chars = [Character]()
    
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let c1 = s1.count
        let c2 = s2.count
        
        if c2 < c1 {
            return false
        }
        
        var map1 = [Character:Int]()
        for ch in s1 {
            map1[ch, default: 0] += 1
        }
        
        chars = Array(s2)
        
        for i in 0...c2-c1 {
            let map = charsToMap(i, i+c1-1)
            if map1 == map {
                return true
            }
        }
        
        return false
    }
    
    private func charsToMap(_ lo: Int, _ hi: Int) -> [Character:Int] {
        var res = [Character:Int]()
        for i in lo...hi {
            res[chars[i], default: 0] += 1
        }
        return res
    }
}
