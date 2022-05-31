class Solution {    
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        if k > s.count {
            return false
        }
        
        var set: Set<String> = []
        // var map = [String:Bool]()
        // fillMap(&map, "", 0, k)
        
        var left = 1 << k
        
        var arr = Array(s)
        for i in 0...s.count-k {
            var subStr = ""
            for j in i..<i+k {
                subStr += String(arr[j])
            }
            
            if !set.contains(subStr) {
                set.insert(subStr)
                
                left -= 1
                    
                if left == 0 {
                    return true
                }
            }
            
//             if let foundSubStr = map[subStr], foundSubStr == false {
//                     map[subStr] = true
//                     left -= 1
                    
//                     if left == 0 {
//                         return true
//                     }
//                 }
        }
        
        return false
    }
    
    private func fillMap(_ map: inout [String:Bool], _ acc: String, _ currIdx: Int, _ maxIdx: Int) {
        if currIdx >= maxIdx {
            return
        }
        
        let zero = acc + "0"
        let one = acc + "1"
        
        map[zero] = false
        map[one] = false
        
        fillMap(&map, zero, currIdx + 1, maxIdx)
        fillMap(&map, one, currIdx + 1, maxIdx)
    }
}
