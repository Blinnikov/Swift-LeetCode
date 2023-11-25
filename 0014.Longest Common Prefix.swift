class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 {
            return ""
        }
        
        var minStr = strs[0]
        for str in strs {
            if str.count < minStr.count {
                minStr = str
            }
        }
        
        while minStr != "" {
            var allMatch = true
            for str in strs {
                if !str.starts(with: minStr) {
                    allMatch = false
                    break // for
                }
            }
            
            if allMatch {
                return minStr
            } else {
                minStr = String(minStr.dropLast())
            }
        }
        
        
        return minStr
    }
}
