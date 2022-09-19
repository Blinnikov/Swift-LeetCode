class Solution {
    func findDuplicate(_ paths: [String]) -> [[String]] {
        var map = [String:[String]]()
        
        for p in paths {
            let components = p.components(separatedBy: CharacterSet(charactersIn: " ()"))
            if components.count == 1 {
                continue
            }
            
            let root = components[0]
            for i in stride(from: 1, to: components.count, by: 3) {
                let file = components[i]
                let content = components[i+1]
                // i+2 is empty string "" after separation by )
                map[content, default: [String]()].append("\(root)/\(file)")
            }
        }
        
        var result = [[String]]()
        
        for (k,v) in map {
            if v.count > 1 {
                result.append(v)
            }
        }
        
        return result
    }
}
