class Solution {
    
    private var arr = [String]()
    private var res = 0
    
    func maxLength(_ arr: [String]) -> Int {
        self.arr = arr
        dfs("", 0)
        return res
    }
    
    private func dfs(_ str: String, _ idx: Int) {
        let uniqueStr = containsOnlyUniqueChars(str)
        
        if uniqueStr {
            res = max(res, str.count)
        }
        
        if !uniqueStr || idx == arr.count {
            return
        }
        
        for i in idx..<arr.count {
            dfs(str + arr[i], i+1)
        }
    }
    
    private func containsOnlyUniqueChars(_ str: String) -> Bool {
        Set(str).count == str.count
    }
}
