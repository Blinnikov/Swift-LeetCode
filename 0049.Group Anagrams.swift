class Solution {
    
    private let a = 97
    
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        
        // var map = [[Int]:[String]]()
        var map = [String:[String]]()
        
        for str in strs {
            map[hash(str), default: [String]()].append(str)
        }
        
        var result = [[String]]()
        
        for (_,v) in map {
            result.append(v)
        }
        
        return result
    }
    
    private func hash_v1(_ str: String) -> [Int] {
        var result = Array(repeating: 0, count: 26)
        
        for ch in str {
            result[Int(ch.asciiValue!)-a] += 1
        }
        
        return result
    }
    
    private func hash(_ str: String) -> String {
        String(str.sorted())
    }
}
